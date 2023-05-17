/**
 */
package tools.vitruv.change.atomic.eobject;

import org.eclipse.emf.ecore.EObject;

import tools.vitruv.change.atomic.AdditiveEChange;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>EObject Added EChange</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * *
 * Abstract EChange which inserts an EObject into a resource or reference.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link tools.vitruv.change.atomic.eobject.EObjectAddedEChange#getNewValue <em>New Value</em>}</li>
 *   <li>{@link tools.vitruv.change.atomic.eobject.EObjectAddedEChange#getNewValueID <em>New Value ID</em>}</li>
 * </ul>
 *
 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectAddedEChange()
 * @model abstract="true"
 * @generated
 */
public interface EObjectAddedEChange<T extends EObject> extends AdditiveEChange<T>
{
	/**
	 * Returns the value of the '<em><b>New Value</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>New Value</em>' reference.
	 * @see #setNewValue(EObject)
	 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectAddedEChange_NewValue()
	 * @model required="true"
	 * @generated
	 */
	T getNewValue();

	/**
	 * Sets the value of the '{@link tools.vitruv.change.atomic.eobject.EObjectAddedEChange#getNewValue <em>New Value</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>New Value</em>' reference.
	 * @see #getNewValue()
	 * @generated
	 */
	void setNewValue(T value);

	/**
	 * Returns the value of the '<em><b>New Value ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>New Value ID</em>' attribute.
	 * @see #setNewValueID(String)
	 * @see tools.vitruv.change.atomic.eobject.EobjectPackage#getEObjectAddedEChange_NewValueID()
	 * @model dataType="tools.vitruv.change.atomic.Id"
	 * @generated
	 */
	String getNewValueID();

	/**
	 * Sets the value of the '{@link tools.vitruv.change.atomic.eobject.EObjectAddedEChange#getNewValueID <em>New Value ID</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>New Value ID</em>' attribute.
	 * @see #getNewValueID()
	 * @generated
	 */
	void setNewValueID(String value);

} // EObjectAddedEChange
