package tools.vitruv.applications.external.umljava.tests.uml2java

import org.eclipse.emf.ecore.util.EcoreUtil
import org.emftext.language.java.containers.Package
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

class UmlJavaExampleThesisSystemTest extends AbstractUmlToJavaTest {
    override getTestSuiteName() {
        "ExampleThesisSystem"
    }

    @BeforeEach
    override protected setup() {
        userInteraction.onMultipleChoiceSingleSelection[choices.contains("java.util.ArrayList")].always.respondWith("java.util.ArrayList")
        super.setup()
    }

    @DisplayName("thesis system example")
    @ParameterizedTest
    @MethodSource("strategiesToTest")
    def void testThesisSystemExample(StateBasedChangeResolutionStrategy strategy) {
        testModelInDirectory("Test1", strategy)
    }

    override extendJavaModel() {
        changeJavaView[
            val rootPackage = rootObjects.filter(Package).filter[name == "root"].claimOne
            val classes = rootPackage.compilationUnits.map[containedClass]
            val department = classes.filter[name == "Department"].claimOne
            val departmentIdSetter = department.methods.filter[name == "setId"].claimOne
            EcoreUtil.delete(departmentIdSetter)

            val student = classes.filter[name == "Student"].claimOne
            val studentSetters = student.methods.filter[name.startsWith("set")]
            studentSetters.forEach[EcoreUtil.delete(it)]

            val teacher = classes.filter[name == "TeachingStaffMember"].claimOne
            val teacherSetters = teacher.methods.filter[name.startsWith("set")]
            teacherSetters.forEach[EcoreUtil.delete(it)]

            val thesis = classes.filter[name == "Thesis"].claimOne
            val thesisIdSetter = thesis.methods.filter[name == "setId"].claimOne
            EcoreUtil.delete(thesisIdSetter)
            val thesisGradeSetter = thesis.methods.filter[name == "setGrade"].claimOne
            EcoreUtil.delete(thesisGradeSetter)

            val thesisSystem = classes.filter[name == "ThesisSystem"].claimOne
            val thesisDepartmentsSetter = thesisSystem.methods.filter[name == "setDepartments"].claimOne
            EcoreUtil.delete(thesisDepartmentsSetter)
        ]
    }

}
