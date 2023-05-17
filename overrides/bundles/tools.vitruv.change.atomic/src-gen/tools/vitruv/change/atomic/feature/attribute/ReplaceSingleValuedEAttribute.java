/**
 */
package tools.vitruv.change.atomic.feature.attribute;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EObject;

import tools.vitruv.change.atomic.feature.single.ReplaceSingleValuedFeatureEChange;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Replace Single Valued EAttribute</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * *
 * EChange which replaces the value of the single valued attribute.
 * <!-- end-model-doc -->
 *
 *
 * @see tools.vitruv.change.atomic.feature.attribute.AttributePackage#getReplaceSingleValuedEAttribute()
 * @model TBounds="org.eclipse.emf.ecore.EJavaObject"
 * @generated
 */
public interface ReplaceSingleValuedEAttribute<A extends EObject, T extends Object> extends ReplaceSingleValuedFeatureEChange<A, EAttribute, T>, AdditiveAttributeEChange<A, T>, SubtractiveAttributeEChange<A, T>
{
} // ReplaceSingleValuedEAttribute
