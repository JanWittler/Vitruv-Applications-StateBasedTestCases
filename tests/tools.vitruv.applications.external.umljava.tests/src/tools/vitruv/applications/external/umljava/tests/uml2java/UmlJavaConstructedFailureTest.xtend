package tools.vitruv.applications.external.umljava.tests.uml2java

import org.eclipse.emf.ecore.util.EcoreUtil
import org.emftext.language.java.containers.Package
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

@DisplayName("[UML -> Java] Constructed Failure")
class UmlJavaConstructedFailureTest extends AbstractUmlToJavaTest {
    override getTestSuiteName() {
        "SimilarityFailing"
    }

    @DisplayName("rename element")
    @ParameterizedTest()
    @MethodSource("strategiesToTest")
    def void testRenameElement(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameElement", strategy)
    }

    @DisplayName("move element")
    @ParameterizedTest()
    @MethodSource("strategiesToTest")
    def void testMoveElement(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveElement", strategy)
    }

    @DisplayName("move renamed element")
    @ParameterizedTest()
    @MethodSource("strategiesToTest")
    def void testMoveRenamedElement(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveRenamedElement", strategy)
    }

    override extendJavaModel() {
        changeJavaView[
            val packages = rootObjects.filter(Package)
            val de = packages.filter[name == "de"].claimOne
            val animal = de.compilationUnits.map[containedClass].filter[name == "DomesticAnimal"].claimOne
            val nicknameSetter = animal.methods.filter[name == "setNickname"].claimOne
            EcoreUtil.delete(nicknameSetter)
        ]
    }
}