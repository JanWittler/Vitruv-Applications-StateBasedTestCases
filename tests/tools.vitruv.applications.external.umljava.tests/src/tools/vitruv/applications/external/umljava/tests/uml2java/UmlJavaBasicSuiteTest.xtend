package tools.vitruv.applications.external.umljava.tests.uml2java

import org.eclipse.emf.ecore.util.EcoreUtil
import org.emftext.language.java.containers.Package
import org.emftext.language.java.expressions.ExpressionsFactory
import org.emftext.language.java.literals.LiteralsFactory
import org.emftext.language.java.members.ClassMethod
import org.emftext.language.java.members.Field
import org.emftext.language.java.operators.OperatorsFactory
import org.emftext.language.java.references.ReferencesFactory
import org.emftext.language.java.statements.StatementsFactory
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

@DisplayName("[UML -> Java] Basic Suite")
class UmlJavaBasicSuiteTest extends AbstractUmlToJavaTest {
    override getTestSuiteName() {
        "BasicSuite"
    }

    @DisplayName("add class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testAddClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("AddClass", strategy)
    }

    @DisplayName("remove class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRemoveClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RemoveClass", strategy)
    }

    @DisplayName("rename class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRenameClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameClass", strategy)
    }

    @DisplayName("move class - easy")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testMoveClassEasy(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveClassEasy", strategy)
    }

    @DisplayName("move class - hard")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testMoveClassHard(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveClassHard", strategy)
    }

    @DisplayName("add attribute")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testAddAttribute(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("AddAttribute", strategy)
    }

    @DisplayName("remove attribute")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRemoveAttribute(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RemoveAttribute", strategy)
    }

    @DisplayName("rename attribute")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRenameAttribute(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameAttribute", strategy)
    }


    @DisplayName("move attribute")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testMoveAttribute(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveAttribute", strategy)
    }

    @DisplayName("add method")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testAddMethod(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("AddMethod", strategy)
    }

    @DisplayName("remove method")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRemoveMethod(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RemoveMethod", strategy)
    }

    @DisplayName("rename method")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRenameMethod(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameMethod", strategy)
    }

    @DisplayName("rename method - extended")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testRenameMethodExtended(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameMethod_extended", strategy)
    }

    @DisplayName("move method")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def testMoveMethod(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveMethod", strategy)
    }

    override extendJavaModel() {
        changeJavaView [
            val firstPackage = rootObjects.filter(Package).filter[name == "com.example.first"].claimOne
            val class = firstPackage.compilationUnits.map[containedClass].filter[name == "Example"].claimOne

            val setName = class.methods.filter [ name == "setName" ].claimOne
            EcoreUtil.delete(setName)

            val nameEquals = class.methods.filter(ClassMethod).filter [ name == "nameEquals" ].claimOne
            // return this.name == otherName;
            val jParamRef = ReferencesFactory.eINSTANCE.createIdentifierReference
            jParamRef.target = nameEquals.parameters.head

            val selfReference = ReferencesFactory.eINSTANCE.createSelfReference
            selfReference.self = LiteralsFactory.eINSTANCE.createThis
            val jField = class.containingConcreteClassifier.members.filter(Field).filter [ name == "name" ].claimOne
            val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
            fieldReference.target = jField
            selfReference.next = fieldReference

            val jComparison = ExpressionsFactory.eINSTANCE.createEqualityExpression
            jComparison.children += selfReference
            jComparison.equalityOperators += OperatorsFactory.eINSTANCE.createEqual
            jComparison.children += jParamRef

            val jStatement = StatementsFactory.eINSTANCE.createReturn
            jStatement.returnValue = jComparison
            nameEquals.statements.add(jStatement)
        ]
    }
}