package tools.vitruv.applications.external.umljava.tests.uml2java

import org.eclipse.emf.ecore.util.EcoreUtil
import org.emftext.language.java.containers.Package
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Nested
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

@DisplayName("[UML -> Java] Model Match Challenge")
class UmlJavaModelMatchChallengeTest extends AbstractUmlToJavaTest {
    override getTestSuiteName() {
        "ModelMatchChallenge"
    }

    @Nested
    @DisplayName("With Associations")
    static class WithAssociations extends UmlJavaModelMatchChallengeTest {
        @DisplayName("move")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testMove(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("MoveElement", strategy)
        }

        @DisplayName("rename")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testRename(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("RenameElement", strategy)
        }

        @DisplayName("move renamed")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testMoveRenamed(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("MoveRenamedElement", strategy)
        }

        @DisplayName("update reference target")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testUpdateReferenceTarget(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("UpdateReferenceTarget", strategy)
        }
    }

    @Nested
    @DisplayName("No Associations")
    static class WithoutAssociations extends UmlJavaModelMatchChallengeTest {
        override protected getTestModelName() {
            "Model_noAssociations.uml"
        }

        @DisplayName("move")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testMove(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("MoveElement", strategy)
        }

        @DisplayName("rename")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testRename(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("RenameElement", strategy)
        }

        @DisplayName("move renamed")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testMoveRenamed(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("MoveRenamedElement", strategy)
        }

        @DisplayName("update reference target")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testUpdateReferenceTarget(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("UpdateReferenceTarget", strategy)
        }
    }

    override extendJavaModel() {
        changeJavaView[
            val packages = rootObjects.filter(Package)
            val de = packages.filter[name == "de"].claimOne
            val animal = de.compilationUnits.map[containedClass].filter[name == "DomesticAnimal"].claimOne
            val speciesSetter = animal.methods.filter[name == "setSpecies"].claimOne
            EcoreUtil.delete(speciesSetter)
        ]
    }

    @Nested
    @DisplayName("Exchange Elements")
    static class ExchangeElements extends UmlJavaModelMatchChallengeTest {
        override getTestSuiteName() {
            "ModelMatchChallenge/ExchangeTest"
        }

        @DisplayName("exchange elements")
        @ParameterizedTest
        @MethodSource("strategiesToTest")
        def testExchangeElements(StateBasedChangeResolutionStrategy strategy) {
            testModelInDirectory("ExchangeElements", strategy)
        }

        override extendJavaModel() {
            changeJavaView[
                val packages = rootObjects.filter(Package)
                val deShop = packages.filter[name == "shop" && namespaces == #["de"]].claimOne
                val animal = deShop.compilationUnits.map[containedClass].filter[name == "DomesticAnimal"].claimOne
                val speciesSetter = animal.methods.filter[name == "setSpecies"].claimOne
                EcoreUtil.delete(speciesSetter)

                val deCore = packages.filter[name == "core" && namespaces == #["de"]].claimOne
                val animalNew = deCore.compilationUnits.map[containedClass].filter[name == "DomesticAnimalNew"].claimOne
                val nicknameSetter = animalNew.methods.filter[name == "setNickname"].claimOne
                EcoreUtil.delete(nicknameSetter)
            ]
        }

    }
}
