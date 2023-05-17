/**
 */
package tools.vitruv.change.atomic;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>EChange</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * *
 * Abstract change, which can be applied forward or backward, after it was resolved to a specific instance of a model.
 * <!-- end-model-doc -->
 *
 *
 * @see tools.vitruv.change.atomic.AtomicPackage#getEChange()
 * @model abstract="true"
 * @generated
 */
public interface EChange extends EObject
{
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * *
	 * Returns if all IDs in this change are resolved to {@link EObjects}.
	 * Needs to be true to apply the change.
	 * @return	Whether elements in this change are resolved or not.
	 * <!-- end-model-doc -->
	 * @model kind="operation" required="true"
	 * @generated
	 */
	boolean isResolved();

} // EChange
