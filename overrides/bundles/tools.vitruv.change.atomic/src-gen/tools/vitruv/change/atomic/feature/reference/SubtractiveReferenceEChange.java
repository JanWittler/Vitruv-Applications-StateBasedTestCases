/**
 */
package tools.vitruv.change.atomic.feature.reference;

import org.eclipse.emf.ecore.EObject;

import tools.vitruv.change.atomic.eobject.EObjectSubtractedEChange;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Subtractive Reference EChange</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * *
 * Abstract EChange which removes an EObject from a reference.
 * <!-- end-model-doc -->
 *
 *
 * @see tools.vitruv.change.atomic.feature.reference.ReferencePackage#getSubtractiveReferenceEChange()
 * @model abstract="true"
 * @generated
 */
public interface SubtractiveReferenceEChange<A extends EObject, T extends EObject> extends UpdateReferenceEChange<A>, EObjectSubtractedEChange<T>
{
} // SubtractiveReferenceEChange
