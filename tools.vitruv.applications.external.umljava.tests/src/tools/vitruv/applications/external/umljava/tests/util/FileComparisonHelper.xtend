package tools.vitruv.applications.external.umljava.tests.util

import java.io.File;
import java.util.List
import org.apache.commons.io.FileUtils

/** A <code>FileComparisonHelper</code> provides domain-specific file comparison. */
interface FileComparisonHelper {
    /**
     * Indicates whether the callee is able to compare the provided files.
     * @param files The files that shall be checked for comparability. In most cases, the array consists of 2 files.
     * @return Returns <code>true</code> if the provided files can be compared by the callee, otherwise <code>false</code>.
     */
    def boolean canCompareFiles(File[] files)

    /**
     * Compares the two given files.
     * @param comparisonHelpers The list of helpers that may be used to compare the file.
     * @param expected The file serving as the ground-truth. Must not be <code>null</code>.
     * @param actual The file to compare. Must not be <code>null</code>.
     * @return Returns the <code>ComparisonResult</code> of comparing the two files. If both files are directories, <code>null</code> is returned.
     */
    static def ComparisonResult compareFiles(List<? extends FileComparisonHelper> comparisonHelpers, File expected, File actual) {
        if (!actual.exists) {
            return expected.exists ? ComparisonResult.MISSING_FILE : ComparisonResult.SEMANTICALLY_IDENTICAL
        } else if (actual.isDirectory != expected.isDirectory) {
            return actual.isDirectory ? ComparisonResult.DIR_INSTEAD_OF_FILE : ComparisonResult.FILE_INSTEAD_OF_DIR
        } else if (actual.isDirectory && expected.isDirectory) {
            return null
        }
        else if (FileUtils.contentEquals(expected, actual)) {
            return ComparisonResult.SEMANTICALLY_IDENTICAL
        }
        return comparisonHelpers
            .filter[ canCompareFiles(#[expected, actual]) ]
            .map [ areFilesSemanticallyIdentical(expected, actual) ]
            .contains(true) ? ComparisonResult.SEMANTICALLY_IDENTICAL : ComparisonResult.INCORRECT_FILE
    }

    /**
     * Compares the given files for semantic identity.
     * @param expected. The file serving as the ground-truth. Must not be <code>null</code>, must exist, must not be a directory.
     * @param actual The file to compare. Must not be <code>null</code>, must exist, must not be a directory.
     * @return Returns <code>true</code> if the two files are semantically identical, otherwise <code>false</code>.
     */
    def boolean areFilesSemanticallyIdentical(File expected, File actual)

    /** The result of a file comparison operation. */
    enum ComparisonResult {
        /** The file is identical or semantically identical to its expected file.
         * Files can be semantically identical but not identical 
         * if e.g. default arguments are not present in one of the files.
         */
        SEMANTICALLY_IDENTICAL,
        /** The file is missing */
        MISSING_FILE,
        /** A directory was expected but a file was encountered. */
        DIR_INSTEAD_OF_FILE,
        /** A file was expected but a directory was encountered. */
        FILE_INSTEAD_OF_DIR,
        /** The file is not correct. */
        INCORRECT_FILE,
        /** A file exists where no file was expected. */
        FILE_SHOULD_NOT_EXIST
    }
}
