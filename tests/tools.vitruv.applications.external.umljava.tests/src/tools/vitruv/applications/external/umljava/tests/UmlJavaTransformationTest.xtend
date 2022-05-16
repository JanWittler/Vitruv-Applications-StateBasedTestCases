package tools.vitruv.applications.external.umljava.tests

import java.nio.file.Path
import java.util.stream.Stream
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.compare.utils.UseIdentifiers
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend.lib.annotations.Accessors
import org.emftext.language.java.JavaClasspath
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Named
import org.junit.jupiter.api.^extension.ExtendWith
import tools.vitruv.applications.external.umljava.tests.util.JavaUmlViewFactory
import tools.vitruv.applications.umljava.JavaToUmlChangePropagationSpecification
import tools.vitruv.applications.umljava.UmlToJavaChangePropagationSpecification
import tools.vitruv.domains.java.JamoppLibraryHelper
import tools.vitruv.domains.java.JavaDomainProvider
import tools.vitruv.domains.uml.UmlDomainProvider
import tools.vitruv.framework.views.View
import tools.vitruv.framework.views.changederivation.DefaultStateBasedChangeResolutionStrategy
import tools.vitruv.testutils.TestLogging
import tools.vitruv.testutils.ViewBasedVitruvApplicationTest

import static tools.vitruv.applications.external.umljava.tests.util.TransformationDirectionConfiguration.configureUnidirectionalExecution

@ExtendWith(TestLogging)
abstract class UmlJavaTransformationTest extends ViewBasedVitruvApplicationTest {
	protected var extension JavaUmlViewFactory viewFactory

	@Accessors(PROTECTED_GETTER)
	static val MODEL_FILE_EXTENSION = "uml"
	@Accessors(PROTECTED_GETTER)
	static val UML_MODEL_NAME = "model"
	@Accessors(PROTECTED_GETTER)
	static val MODEL_FOLDER_NAME = "model"

	@BeforeEach
	def void setupClasspathAndViewFactory() {
		// Reset Java classpath before every test to ensure that caches are reset
		// and not objects are stored and produce memory leaks
		JavaClasspath.reset()
		JamoppLibraryHelper.registerStdLib()
		viewFactory = new JavaUmlViewFactory(virtualModel)
		configureBidirectionalExecution
	}

	@BeforeEach
	def setupTransformationDirection() {
		configureUnidirectionalExecution()
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

    def static void configureBidirectionalExecution() {
        new JavaDomainProvider().domain.enableTransitiveChangePropagation
        new UmlDomainProvider().domain.enableTransitiveChangePropagation
    }
}
