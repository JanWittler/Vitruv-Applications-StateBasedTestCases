/**
 */
package tools.vitruv.change.atomic.eobject;

import org.eclipse.emf.ecore.EObject;

import tools.vitruv.change.atomic.SubtractiveEChange;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>EObject Subtracted EChange</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * *
 * Abstract EChange which removes an EObject from a resource or reference.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link tools.vitruv.change.atomic.eobject.EObjectSubtractedEChange#getOldValue <em>Old Value</em>}</li>
 *   <li>{@link tools.vitruv.change.atomic.eobject.EObjectSubtractedEChange#getOldValueID <em>Old Value ID</em>}</li>
 * </ul>
 *
 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectSubtractedEChange()
 * @model abstract="true"
 * @generated
 */
public interface EObjectSubtractedEChange<T extends EObject> extends SubtractiveEChange<T>
{
	/**
	 * Returns the value of the '<em><b>Old Value</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Old Value</em>' reference.
	 * @see #setOldValue(EObject)
	 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectSubtractedEChange_OldValue()
	 * @model required="true"
	 * @generated
	 */
	T getOldValue();

	/**
	 * Sets the value of the '{@link tools.vitruv.change.atomic.eobject.EObjectSubtractedEChange#getOldValue <em>Old Value</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Old Value</em>' reference.
	 * @see #getOldValue()
	 * @generated
	 */
	void setOldValue(T value);

	/**
	 * Returns the value of the '<em><b>Old Value ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Old Value ID</em>' attribute.
	 * @see #setOldValueID(String)
	 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectSubtractedEChange_OldValueID()
	 * @model dataType="tools.vitruv.change.atomic.Id"
	 * @generated
	 */
	String getOldValueID();

	/**
	 * Sets the value of the '{@link tools.vitruv.change.atomic.eobject.EObjectSubtractedEChange#getOldValueID <em>Old Value ID</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Old Value ID</em>' attribute.
	 * @see #getOldValueID()
	 * @generated
	 */
	void setOldValueID(String value);

} // EObjectSubtractedEChange
