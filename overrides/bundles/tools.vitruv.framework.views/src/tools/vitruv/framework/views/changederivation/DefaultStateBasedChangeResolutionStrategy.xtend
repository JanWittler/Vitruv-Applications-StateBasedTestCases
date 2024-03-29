package tools.vitruv.framework.views.changederivation

import org.eclipse.emf.common.notify.Notifier
import org.eclipse.emf.common.util.BasicMonitor
import org.eclipse.emf.compare.EMFCompare
import org.eclipse.emf.compare.ReferenceChange
import org.eclipse.emf.compare.match.impl.MatchEngineFactoryImpl
import org.eclipse.emf.compare.match.impl.MatchEngineFactoryRegistryImpl
import org.eclipse.emf.compare.merge.BatchMerger
import org.eclipse.emf.compare.merge.IMerger
import org.eclipse.emf.compare.scope.DefaultComparisonScope
import org.eclipse.emf.compare.utils.UseIdentifiers
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import tools.vitruv.change.composite.recording.ChangeRecorder
import tools.vitruv.framework.views.util.ResourceCopier

import static com.google.common.base.Preconditions.checkArgument

import static extension edu.kit.ipd.sdq.commons.util.org.eclipse.emf.ecore.resource.ResourceUtil.getReferencedProxies

/**
 * This default strategy for diff based state changes uses EMFCompare to resolve a 
 * diff to a sequence of individual changes.
 * @author Timur Saglam
 */
class DefaultStateBasedChangeResolutionStrategy implements StateBasedChangeResolutionStrategy {
	/** The identifier matching behavior used by this strategy */
	public val UseIdentifiers useIdentifiers

	/**
	 * Creates a new instance with the default identifier matching behavior 
	 * which is match by identifier when available.
	 */
	new() {
		this(UseIdentifiers.WHEN_AVAILABLE)
	}

	/**
	 * Creates a new instance with the provided identifier matching behavior.
	 * @param useIdentifiers The identifier matching behavior to use.
	 */
	new(UseIdentifiers useIdentifiers) {
		this.useIdentifiers = useIdentifiers
	}

	private def checkNoProxies(Resource resource, String stateNotice) {
		val proxies = resource.referencedProxies
		checkArgument(proxies.empty, "%s '%s' should not contain proxies, but contains the following: %s", stateNotice,
			resource.URI, String.join(", ", proxies.map[toString]))
	}

	override getChangeSequenceBetween(Resource newState, Resource oldState) {
		checkArgument(oldState !== null && newState !== null, "old state or new state must not be null!")
		newState.checkNoProxies("new state")
		oldState.checkNoProxies("old state")
		val monitoredResourceSet = new ResourceSetImpl()
		val currentStateCopy = ResourceCopier.copyViewResource(oldState, monitoredResourceSet)
		return currentStateCopy.record [
			if (oldState.URI != newState.URI) {
				currentStateCopy.URI = newState.URI
			}
			compareStatesAndReplayChanges(newState, currentStateCopy)
		]
	}

	override getChangeSequenceForCreated(Resource newState) {
		checkArgument(newState !== null, "new state must not be null!")
		newState.checkNoProxies("new state")
		// It is possible that root elements are automatically generated during resource creation (e.g., Java packages).
		// Thus, we create the resource and then monitor the re-insertion of the elements
		val monitoredResourceSet = new ResourceSetImpl()
		val newResource = monitoredResourceSet.createResource(newState.URI)
		newResource.contents.clear()
		return newResource.record [
			newResource.contents += EcoreUtil.copyAll(newState.contents)
		]
	}

	override getChangeSequenceForDeleted(Resource oldState) {
		checkArgument(oldState !== null, "old state must not be null!")
		oldState.checkNoProxies("old state")
		// Setup resolver and copy state:
		val monitoredResourceSet = new ResourceSetImpl()
		val currentStateCopy = ResourceCopier.copyViewResource(oldState, monitoredResourceSet)
		return currentStateCopy.record [
			currentStateCopy.contents.clear()
		]
	}

	private def <T extends Notifier> record(Resource resource, ()=>void function) {
		try (val changeRecorder = new ChangeRecorder(resource.resourceSet)) {
			changeRecorder.beginRecording
			changeRecorder.addToRecording(resource)
			function.apply()
			return changeRecorder.endRecording
		}
	}

	/**
	 * Compares states using EMFCompare and replays the changes to the current state.
	 */
	private def compareStatesAndReplayChanges(Notifier newState, Notifier currentState) {
		val scope = new DefaultComparisonScope(newState, currentState, null)
		val emfCompare = (EMFCompare.builder => [
			matchEngineFactoryRegistry = MatchEngineFactoryRegistryImpl.createStandaloneInstance => [
				add(new MatchEngineFactoryImpl(useIdentifiers))
			]
		]).build
		val differences = emfCompare.compare(scope).differences

		// ########### OVERRIDE START ###########
		/** The UML implementation used by Eclipse has non-derived relationships which are auto-populated
		 * when other fields of the class change. This is recognized by EMF Compare as two changes which
		 * results in failure when re-applying changes as the change is applied twice: once by UML as a
		 * reaction to the affecting field being populated and once by the derived diff.
		 */
		for (var i = differences.size - 1; i >= 0; i--) {
			if (differences.get(i) instanceof ReferenceChange) {
				val diff = differences.get(i) as ReferenceChange
				if (diff.reference.name == "memberEnd" && differences.exists [
					diff.kind == kind && it instanceof ReferenceChange &&
						(it as ReferenceChange).reference.name == "ownedEnd" &&
						(it as ReferenceChange).value === diff.value &&
						(it as ReferenceChange).reference.eContainer === diff.reference.eContainer
				]) {
					differences.remove(i)
					EcoreUtil.delete(diff)
				}
			}
		}
		// ########### OVERRIDE END ###########
		// Replay the EMF compare differences
		val mergerRegistry = IMerger.RegistryImpl.createStandaloneInstance()
		val merger = new BatchMerger(mergerRegistry)
		merger.copyAllLeftToRight(differences, new BasicMonitor)
	}
}
