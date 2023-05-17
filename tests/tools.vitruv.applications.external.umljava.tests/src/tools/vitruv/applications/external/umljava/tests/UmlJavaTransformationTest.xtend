package tools.vitruv.applications.external.umljava.tests

import java.nio.file.Path
import java.util.stream.Stream
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.compare.utils.UseIdentifiers
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Named
import org.junit.jupiter.api.^extension.ExtendWith
import tools.vitruv.applications.external.umljava.tests.util.JavaUmlViewFactory
import tools.vitruv.applications.umljava.JavaToUmlChangePropagationSpecification
import tools.vitruv.applications.umljava.UmlToJavaChangePropagationSpecification
import tools.vitruv.applications.util.temporary.java.JavaSetup
import tools.vitruv.framework.views.View
import tools.vitruv.framework.views.changederivation.DefaultStateBasedChangeResolutionStrategy
import tools.vitruv.testutils.TestLogging
import tools.vitruv.testutils.ViewBasedVitruvApplicationTest

import static tools.vitruv.applications.external.umljava.tests.util.TransformationDirectionConfiguration.configureUnidirectionalExecution
import static tools.vitruv.applications.external.umljava.tests.util.TransformationDirectionConfiguration.configureBidirectionalExecution

@ExtendWith(TestLogging)
abstract class UmlJavaTransformationTest extends ViewBasedVitruvApplicationTest {
	protected var extension JavaUmlViewFactory viewFactory

	@Accessors(PROTECTED_GETTER)
	static val MODEL_FILE_EXTENSION = "uml"
	@Accessors(PROTECTED_GETTER)
	static val UML_MODEL_NAME = "model"
	@Accessors(PROTECTED_GETTER)
	static val MODEL_FOLDER_NAME = "model"
	
	@BeforeAll
	def static void setupJavaFactories() {
		JavaSetup.prepareFactories()
	}

	@BeforeEach
	def void setupClasspathAndViewFactory() {
		JavaSetup.resetClasspathAndRegisterStandardLibrary()
		viewFactory = new JavaUmlViewFactory(virtualModel)
	}

	@BeforeEach
	def setupTransformationDirection() {
		configureUnidirectionalExecution(virtualModel)
	}

	protected def Path getProjectModelPath(String modelName) {
		Path.of(MODEL_FOLDER_NAME).resolve(modelName + "." + MODEL_FILE_EXTENSION)
	}
	
	protected def Path getJavaViewDirectory() {
	    Path.of("src")
	}

	override protected getChangePropagationSpecifications() {
		return #[new UmlToJavaChangePropagationSpecification(), new JavaToUmlChangePropagationSpecification()]
	}

	protected def void createAndRegisterRoot(View view, EObject rootObject, URI persistenceUri) {
		view.registerRoot(rootObject, persistenceUri)
	}
	
	static def strategiesToTest() {
        Stream.of(
            Named.of("identifiers when available", new DefaultStateBasedChangeResolutionStrategy(UseIdentifiers.WHEN_AVAILABLE)),
            Named.of("only identifiers", new DefaultStateBasedChangeResolutionStrategy(UseIdentifiers.ONLY)),
            Named.of("never identifiers", new DefaultStateBasedChangeResolutionStrategy(UseIdentifiers.NEVER))
        )
    }
}
