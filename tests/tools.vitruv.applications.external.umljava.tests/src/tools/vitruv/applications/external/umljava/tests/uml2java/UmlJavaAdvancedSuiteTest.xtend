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

    /**
     * Changes:
     * - Change Data.deserialize.static = true
     * - Change Data.deserialize.returnType to Boolean
     * - Add parameter to Data.deserialize
     * - Change name of new parameter to data
     * - Change type of new parameter to Data
     * - Rename Data.deserialize to deserializeData
     */
    @DisplayName("change method signature")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void changeMethodSignature(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ChangeMethodSignature", strategy)
    }

    /**
     * Changes:
     * - Change Data.deserialize.static = true
     * - Add parameter to Data.deserialize
     * - Change name of new parameter to data
     * - Change type of new parameter to Data
     * - Rename Data.deserialize to toStringRepresentation
     */
    @DisplayName("change method signature - complex")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void changeMethodSignature_Extended(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ChangeMethodSignature_extended", strategy)
    }

    /**
     * Changes:
     * - Move AbstractData.binaryData to Data
     * - Delete AbstractData
     */
    @DisplayName("collapse hierarchy")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testCollapseHierarchy(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("CollapseHierarchy", strategy)
    }

    /**
     * Changes:
     * - Create class Interface in package basic.config
     * - Add inheritance from ProvidedInterface to Interface
     * - Move ProvidedInterface.name to Interface
     * - Move ProvidedInterface.providedMethods to Interface
     * - Rename Interface.providedMethods to methods
     * - Add inheritance from RequiredInterface to Interface
     * - Delete RequiredInterface.name
     * - Delete RequiredInterface.requiredMethods
     */
    @DisplayName("extract superclass")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testExtractSuperclass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ExtractSuperclass", strategy)
    }

    /**
     * Changes:
     * - Move Metadata.encoding to Data
     * - Delete Metadata
     */
    @DisplayName("inline class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testInlineClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("InlineClass", strategy)
    }

    /**
     * Changes:
     * - Create class Printer in package basic.config
     * - Move EJB.printProvidedInterfaces to Printer
     * - Add parameter to Printer.printProvidedInterfaces
     * - Change name of new parameter to ejb
     * - Change type of new parameter to EJB
     * - Move EJB.printRequiredInterfaces to Printer
     * - Add parameter to Printer.printRequiredInterfaces
     * - Change name of new parameter to ejb
     * - Change type of new parameter to EJB
     * - Add property to EJB
     * - Change name of new property to printer
     * - Create new association between EJB and Printer
     * - Add EJB.printer to memberEnd of new association
     * - Create new ownedEnd in new association
     * - Change name of ownedEnd to ejb
     * - Change type of ownedEnd to EJB
     * - Change cardinality of ejb in new association to 1..1
     * - Change cardinality of printer in new association to 1..1
     */
    @DisplayName("extract associated class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testExtractAssociatedClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("ExtractAssociatedClass", strategy)
    }

    /**
     * Changes:
     * - Delete class LegacyData
     */
    @DisplayName("remove associated class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRemoveAssociatedClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RemoveAssociatedClass", strategy)
    }

    /**
     * Changes:
     * - Change name of Method to Operation
     * - Change name of ProvidedInterface.providedMethods to providedOperations
     * - Change name of RequiredInterface.requiredMethods to requiredOperations
     */
    @DisplayName("rename class")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRenameClass(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameClass", strategy)
    }

    /**
     * Changes:
     * - Change name of Method to Operation
     * - Change name of ProvidedInterface.providedMethods to operations
     * - Change name of RequiredInterface.requiredMethods to operations
     */
    @DisplayName("rename class - complex")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testRenameClass_Extended(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("RenameClass_extended", strategy)
    }

    /**
     * Changes:
     * - Create package l2 in package basic.config
     * - Create package l3 in package basic.config.l2
     * - Move LegacyData to package basic.config.l2.l3
     */
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
