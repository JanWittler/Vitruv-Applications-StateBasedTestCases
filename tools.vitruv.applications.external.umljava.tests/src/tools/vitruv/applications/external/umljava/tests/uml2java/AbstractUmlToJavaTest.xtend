package tools.vitruv.applications.external.umljava.tests.uml2java

import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.emf.ecore.xmi.XMLResource
import org.junit.jupiter.api.BeforeEach
import tools.vitruv.applications.external.umljava.tests.UmlJavaTransformationTest
import tools.vitruv.applications.external.umljava.tests.util.FileComparisonHelper
import tools.vitruv.applications.external.umljava.tests.util.FileComparisonHelper.ComparisonResult
import tools.vitruv.applications.external.umljava.tests.util.JavaFileComparisonHelper
import tools.vitruv.framework.views.View
import tools.vitruv.framework.views.changederivation.DefaultStateBasedChangeResolutionStrategy
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy

import static com.google.common.base.Preconditions.*
import static org.junit.jupiter.api.Assertions.assertEquals
import static tools.vitruv.applications.external.umljava.tests.util.UmlEqualityHelper.assertIsEqual

import static extension edu.kit.ipd.sdq.commons.util.java.lang.IterableUtil.claimOne

abstract class AbstractUmlToJavaTest extends UmlJavaTransformationTest {
    protected def getTestModelName() {
        "Model.uml"
    }

    abstract def String getTestSuiteName()

    abstract def void extendJavaModel()

    @BeforeEach
    def protected void setup() {
        val modelPath = Path.of("testresources/" + testSuiteName + "/" + testModelName)
        changeUmlView(new DefaultStateBasedChangeResolutionStrategy) [
            val testResource = getTestResource(modelPath)
            val viewURI = UML_MODEL_NAME.projectModelPath.uri
            registerRoot(testResource.contents.claimOne, viewURI)
        ]
        extendJavaModel
        validateUmlView [
            val testResource = getTestResource(modelPath)
            val viewResource = umlViewResource
            assertIsEqual(testResource, viewResource)
        ]
        assertJavaFilesEqual(modelPath.parent)
    }

    def void testModelInDirectory(String directory, StateBasedChangeResolutionStrategy strategy) {
        val modelPath = Path.of("testresources/" + testSuiteName + "/tests/" + directory + "/" + testModelName)
        changeUmlView(strategy) [
            val initialModelPath = Path.of("testresources/" + testSuiteName + "/" + testModelName)
            val initialTestResource = getTestResource(initialModelPath) as XMLResource
            val viewResource = umlViewResource as XMLResource
            updatePreservingViewResourceXmiIds(viewResource, initialTestResource) [
                unload
                Files.copy(modelPath, Path.of(URI.toFileString), StandardCopyOption.REPLACE_EXISTING)
                load(null)
            ]
            // required for correct basic type comparison like Int
            EcoreUtil.resolveAll(viewResource)
        ]
        validateUmlView [
            val testResource = getTestResource(modelPath)
            val viewResource = umlViewResource
            assertIsEqual(testResource, viewResource)
        ]
        assertJavaFilesEqual(modelPath.parent)
    }

    private def getUmlViewResource(View view) {
        val storageURI = UML_MODEL_NAME.projectModelPath.uri
        view.rootObjects.map[eResource].filterNull.filter[URI == storageURI].toSet.head
    }

    private def getTestResource(Path modelPath) {
        val resourceSet = new ResourceSetImpl
        val uri = URI.createFileURI(modelPath.toFile.absolutePath)
        resourceSet.getResource(uri, true)
    }

    private def updatePreservingViewResourceXmiIds(XMLResource viewResource, XMLResource externalResource,
        (XMLResource)=>void resourceUpdate) {
        var idMapping = new HashMap<String, String>()
        val viewIterator = viewResource.allContents
        val externalIterator = externalResource.allContents
        while (viewIterator.hasNext && externalIterator.hasNext) {
            val viewObject = viewIterator.next
            val externalObject = externalIterator.next
            checkState(viewObject.eClass === externalObject.eClass, "non matching elements %s and %s", viewObject,
                externalObject)
            idMapping.put(externalResource.getID(externalObject), viewResource.getID(viewObject))
        }
        checkState(!viewIterator.hasNext, "view resource has too many elements")
        checkState(!externalIterator.hasNext, "external resource has too many elements")

        resourceUpdate.apply(viewResource)

        for (entry : idMapping.entrySet) {
            val externalId = entry.key
            val viewId = entry.value
            val viewObject = viewResource.getEObject(externalId)
            if (viewObject !== null) {
                viewResource.setID(viewObject, viewId)
            }
        }
    }

    private def assertJavaFilesEqual(Path directory) {
        val actualDirectory = javaViewDirectory.uri
        assertFileOrDirectoryEquals(new File(directory.toFile, "expected_src"),
            Path.of(actualDirectory.toFileString).toFile)
    }

    /**
     * Asserts that the two provided file objects contain equal content.
     * If directories are provided, a deep comparison of the directories content is performed.
     * If files are provided, they are compared for equality. 
     * To compare files @{link #compareFiles(File,File)} is used.
     * @param The file or directory expected.
     * @param The file or directory actually present.
     */
    private def assertFileOrDirectoryEquals(File expected, File actual) {
        val result = compareFileOrDirectory(expected, actual)
        val incorrectResults = result.filter[_, value|value != ComparisonResult.SEMANTICALLY_IDENTICAL]
        assertEquals(0, incorrectResults.size, '''got incorrect results for files: «incorrectResults»''')
    }

    /**
     * Compares two files for equality. Uses @{link FileComparisonHelper} to compare files.
     * @param expected The expected file.
     * @param actual The actual file.
     * @return Returns <code>true</code> if both files are semantically identical, otherwise <code>false</code>.
     */
    private def compareFiles(File expected, File actual) {
        return FileComparisonHelper.compareFiles(#[new JavaFileComparisonHelper], expected, actual)
    }

    private def Map<File, ComparisonResult> compareFileOrDirectory(File expected, File actual) {
        val result = new HashMap<File, ComparisonResult>()
        val comparisonResult = compareFiles(expected, actual)
        if (comparisonResult !== null) {
            result.put(actual, comparisonResult)
        }
        val visitedFiles = new HashSet<File>()
        if (expected.isDirectory) {
            for (File file : expected.listFiles().filter[f|!f.hidden]) {
                val relativize = expected.toPath().relativize(file.toPath())
                val fileInOther = actual.toPath().resolve(relativize).toFile()
                visitedFiles += fileInOther
                val subResult = compareFileOrDirectory(file, fileInOther)
                subResult.forEach[key, value|result.put(key, value)]
            }
        }
        if (actual.isDirectory) {
            for (File file : actual.listFiles().filter[f|!f.hidden]) {
                if (!visitedFiles.contains(file)) {
                    result.put(file, ComparisonResult.FILE_SHOULD_NOT_EXIST)
                }
            }
        }
        return result
    }
}
