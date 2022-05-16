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
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

@DisplayName("[UML -> Java] Advanced Suite")
class UmlJavaAdvancedSuiteTest extends AbstractUmlToJavaTest {

    override getTestSuiteName() {
        "AdvancedSuite"
    }

    @BeforeEach
    override protected setup() {
        userInteraction.onMultipleChoiceSingleSelection[choices.contains("java.util.ArrayList")].always.respondWith("java.util.ArrayList")
        super.setup()
    }

    @DisplayName("change method signature")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void changeMethodSignature(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ChangeMethodSignature", strategy)
    }

    @DisplayName("change method signature - complex")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void changeMethodSignature_Extended(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ChangeMethodSignature_extended", strategy)
    }

    @DisplayName("collapse hierarchy")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testCollapseHierarchy(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("CollapseHierarchy", strategy)
    }

    @DisplayName("extract superclass")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testExtractSuperclass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ExtractSuperclass", strategy)
    }

    @DisplayName("inline class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testInlineClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("InlineClass", strategy)
    }

    @DisplayName("extract associated class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testExtractAssociatedClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ExtractAssociatedClass", strategy)
    }

    @DisplayName("remove associated class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRemoveAssociatedClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RemoveAssociatedClass", strategy)
    }

    @DisplayName("rename class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRenameClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameClass", strategy)
    }

    @DisplayName("rename class - complex")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRenameClass_Extended(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameClass_extended", strategy)
    }

    @DisplayName("move class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testMoveClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("MoveClass", strategy)
    }

    override extendJavaModel() {
        changeJavaView[
            val packages = rootObjects.filter(Package).toList
            val configPackage = packages.filter[name == "config" && namespaces == #["basic"]].claimOne
            val configClasses = configPackage.compilationUnits.map[containedClass]
            {
                val class = configClasses.filter[name == "Method"].claimOne
                val method = class.methods.filter(ClassMethod).filter[name == "toString"].claimOne
                // return this.name;
                val jStatement = StatementsFactory.eINSTANCE.createReturn
                val jReference = ReferencesFactory.eINSTANCE.createSelfReference
                jReference.self = LiteralsFactory.eINSTANCE.createThis
                val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
                fieldReference.target = class.containingConcreteClassifier.members.filter(Field).filter[name == "name"].
                    claimOne
                jReference.next = EcoreUtil.copy(fieldReference)
                jStatement.returnValue = jReference
                method.statements.add(jStatement)
            }

            {
                val class = configClasses.filter[name == "ProvidedInterface"].claimOne
                val setter = class.methods.filter[name == "setProvidedMethods"].claimOne
                EcoreUtil.delete(setter)
            }

            {
                val class = configClasses.filter[name == "RequiredInterface"].claimOne
                val setter = class.methods.filter[name == "setRequiredMethods"].claimOne
                EcoreUtil.delete(setter)
            }

            {
                val class = configClasses.filter[name == "EJB"].claimOne
                val setters = class.methods.filter[name.startsWith("set")]
                setters.forEach[EcoreUtil.delete(it)]

                { // printRequiredInterfaces();
                    val printRequired = class.methods.filter(ClassMethod).filter[name == "printRequiredInterfaces"].
                        claimOne
                    val jRecursive = ReferencesFactory.eINSTANCE.createMethodCall
                    jRecursive.target = printRequired
                    val jExpression = ExpressionsFactory.eINSTANCE.createUnaryExpression
                    jExpression.child = jRecursive
                    val jStatement = StatementsFactory.eINSTANCE.createExpressionStatement
                    jStatement.expression = jExpression
                    printRequired.statements.add(jStatement)
                }

                { // printProvidedInterfaces();
                    val printProvided = class.methods.filter(ClassMethod).filter[name == "printProvidedInterfaces"].
                        claimOne
                    val jRecursive = ReferencesFactory.eINSTANCE.createMethodCall
                    jRecursive.target = printProvided
                    val jExpression = ExpressionsFactory.eINSTANCE.createUnaryExpression
                    jExpression.child = jRecursive
                    val jStatement = StatementsFactory.eINSTANCE.createExpressionStatement
                    jStatement.expression = jExpression
                    printProvided.statements.add(jStatement)
                }
            }

            {
                val class = configClasses.filter[name == "Config"].claimOne
                for (methodName : #["getTimestamp", "setTimestamp", "getReconfigurable", "setReconfigurable", "setEjbs",
                    "getEjbs"]) {
                    val accessor = class.methods.filter[name == methodName].claimOne
                    EcoreUtil.delete(accessor)
                }

                { // return this.reconfigurable;
                    val method = class.methods.filter(ClassMethod).filter[name == "isReconfigurable"].claimOne
                    val jStatement = StatementsFactory.eINSTANCE.createReturn
                    val jReference = ReferencesFactory.eINSTANCE.createSelfReference
                    jReference.self = LiteralsFactory.eINSTANCE.createThis
                    val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
                    fieldReference.target = class.containingConcreteClassifier.members.filter(Field).filter [
                        name == "reconfigurable"
                    ].claimOne
                    jReference.next = EcoreUtil.copy(fieldReference)
                    jStatement.returnValue = jReference
                    method.statements.add(jStatement)
                }

                { // return this.ejbs;
                    val method = class.methods.filter(ClassMethod).filter[name == "getEJBs"].claimOne
                    val jStatement = StatementsFactory.eINSTANCE.createReturn
                    val jReference = ReferencesFactory.eINSTANCE.createSelfReference
                    jReference.self = LiteralsFactory.eINSTANCE.createThis
                    val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
                    fieldReference.target = class.containingConcreteClassifier.members.filter(Field).filter [
                        name == "ejbs"
                    ].claimOne
                    jReference.next = EcoreUtil.copy(fieldReference)
                    jStatement.returnValue = jReference
                    method.statements.add(jStatement)
                }
            }

            val data = packages.filter[name == "data" && namespaces == #["basic"]].claimOne
            val dataClasses = data.compilationUnits.map[containedClass]
            {
                val class = dataClasses.filter[name == "CurrentUser"].claimOne
                val setters = class.methods.filter[name.startsWith("set")]
                setters.forEach[EcoreUtil.delete(it)]

                val constructor = class.constructors.claimOne
                // this.<paramName> = <paramName>;
                constructor.parameters.forEach [ parameter |
                    val jParamRef = ReferencesFactory.eINSTANCE.createIdentifierReference
                    jParamRef.target = parameter

                    val selfReference = ReferencesFactory.eINSTANCE.createSelfReference
                    selfReference.self = LiteralsFactory.eINSTANCE.createThis
                    val jField = constructor.containingConcreteClassifier.members.filter(Field).filter [
                        name == parameter.name
                    ].head
                    val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
                    fieldReference.target = jField
                    selfReference.next = fieldReference

                    val jAssignment = ExpressionsFactory.eINSTANCE.createAssignmentExpression
                    jAssignment.child = selfReference
                    jAssignment.assignmentOperator = OperatorsFactory.eINSTANCE.createAssignment
                    jAssignment.value = jParamRef

                    val jStatement = StatementsFactory.eINSTANCE.createExpressionStatement
                    jStatement.expression = jAssignment
                    constructor.statements.add(jStatement)
                ]
            }

            {
                val class = dataClasses.filter[name == "Data"].claimOne
                val method = class.methods.filter(ClassMethod).filter[name == "deserialize"].claimOne
                val jStatement = StatementsFactory.eINSTANCE.createReturn
                val jReference = ReferencesFactory.eINSTANCE.createSelfReference
                jReference.self = LiteralsFactory.eINSTANCE.createThis
                val fieldReference = ReferencesFactory.eINSTANCE.createIdentifierReference
                fieldReference.target = class.containingConcreteClassifier.members.filter(Field).filter [
                    name == "metadata"
                ].claimOne
                jReference.next = EcoreUtil.copy(fieldReference)
                jStatement.returnValue = jReference
                method.statements.add(jStatement)
            }

            {
                val class = dataClasses.filter[name == "LegacyData"].claimOne
                val setter = class.methods.filter[name == "setRequiredInterface"].claimOne
                EcoreUtil.delete(setter)
            }

            {
                val class = dataClasses.filter[name == "Metadata"].claimOne
                val setter = class.methods.filter[name == "setEncoding"].claimOne
                EcoreUtil.delete(setter)
            }
        ]
    }
}
