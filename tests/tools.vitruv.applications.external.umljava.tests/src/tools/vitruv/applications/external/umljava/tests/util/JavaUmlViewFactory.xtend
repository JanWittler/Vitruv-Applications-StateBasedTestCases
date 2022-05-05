package tools.vitruv.applications.external.umljava.tests.util

import org.eclipse.uml2.uml.Model
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.emftext.language.java.containers.CompilationUnit
import org.emftext.language.java.containers.Package
import tools.vitruv.framework.views.View
import tools.vitruv.framework.views.changederivation.StateBasedChangeResolutionStrategy
import tools.vitruv.testutils.TestViewFactory

@FinalFieldsConstructor
class JavaUmlViewFactory extends TestViewFactory {
	private def View createUmlView() {
		createViewOfElements("UML", #{Model})
	}

	private def View createJavaView() {
		createViewOfElements("Java packages and classes", #{Package, CompilationUnit})
	}

	/**
	 * Changes the UML view containing all UML models as root elements 
	 * according to the given modification function. 
	 * Derives the performed changes, commits the derived changes, and closes the view afterwards.
	 */
	def void changeUmlView(StateBasedChangeResolutionStrategy strategy, (View)=>void modelModification) {
		changeViewDerivingChanges(createUmlView, strategy, modelModification)
	}

	/**
	 * Changes the Java view containing all Java packages and classes as root elements 
	 * according to the given modification function. 
	 * Derives the performed changes, commits the derived changes, and closes the view afterwards.
	 */
	def void changeJavaView((View)=>void modelModification) {
		changeViewRecordingChanges(createJavaView, modelModification)
	}

	/**
	 * Validates the UML view containing all UML models by applying the validation function
	 * and closes the view afterwards.
	 */
	def void validateUmlView((View)=>void viewValidation) {
		validateView(createUmlView, viewValidation)
	}

	/**
	 * Validates the Java view containing all packages and classes by applying the validation function
	 * and closes the view afterwards.
	 */
	def void validateJavaView((View)=>void viewValidation) {
		validateView(createJavaView, viewValidation)
	}

}
