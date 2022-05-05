package tools.vitruv.applications.external.umljava.tests.util

import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.util.ArrayList
import java.util.HashSet
import java.util.Set
import org.apache.commons.io.FilenameUtils

class JavaFileComparisonHelper implements FileComparisonHelper {
    /** Accepts files if they all have the file extension "java". */
    override canCompareFiles(File[] files) {
        files.forall [ FilenameUtils.getExtension(path) == "java" ]
    }

    /**
     * Compares two java files.
     * The comparison compares each line of the files for equality, leading or trailing whitespaces are ignored.
     * Empty lines are ignored.
     * Spaces before semicolon are ignored.
     * Lines starting with an import statement are not compared as imports are currently not cleaned up by the consistency mechanism.
     * Fully-qualified classifiers are automatically resolved if they got imported before. To address faulty import generation, imports from both files are used for resolving.
     */
    override areFilesSemanticallyIdentical(File expected, File actual) {
        val readerExpected = new BufferedReader(new FileReader(expected))
        val readerActual = new BufferedReader(new FileReader(actual))

        val imports = new HashSet<String>()
        val expectedLines = new ArrayList<String>()
        val actualLines = new ArrayList<String>()

        var lineExpected = readerExpected.readLineTrimmed(imports)
        var lineActual = readerActual.readLineTrimmed(imports)
        while (lineExpected !== null || lineActual !== null) {
            if (lineExpected !== null && (lineExpected.startsWith("import") || lineExpected.empty)) {
                val import = lineExpected.extractImportedClassifier
                if (import !== null) {
                    imports += import
                }
                lineExpected = readerExpected.readLineTrimmed(imports)
            } else if (lineActual !== null && (lineActual.startsWith("import") || lineActual.empty)) {
                val import = lineActual.extractImportedClassifier
                if (import !== null) {
                    imports += import
                }
                lineActual = readerActual.readLineTrimmed(imports)
            } else if ((lineExpected === null) != (lineActual === null)) {
                return false
            } else {
                expectedLines.add(lineExpected)
                actualLines.add(lineActual)
                lineExpected = readerExpected.readLineTrimmed(imports)
                lineActual = readerActual.readLineTrimmed(imports)
            }
        }
        return expectedLines.sort == actualLines.sort
    }

    private static def readLineTrimmed(BufferedReader reader, Set<String> imports) {
        var line = reader.readLine?.trim?.replace(" ;", ";")
        if (line === null) {
            return null
        }
        for (import: imports) {
            val classifier = import.split("\\.").last
            line = line.replace(import, classifier)
        }
        //generics are incorrectly formatted to miss a space
        return line.replace("> ", ">")
    }

    private static def extractImportedClassifier(String line) {
        if (!line.startsWith("import") || !line.endsWith(";")) {
            return null
        }
        var trimmedLine = line.substring("import".length)
        trimmedLine = trimmedLine.substring(0, trimmedLine.length - 1)
        val parts = trimmedLine.split(" ").filter [ !replace(" ", "").empty ]
        if (parts.length === 1) {
            return parts
        }
        return null
    }
}