/**
 */
package tools.vitruv.change.atomic.feature;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

import tools.vitruv.change.atomic.AtomicPackage;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see tools.vitruv.change.atomic.feature.FeatureFactory
 * @model kind="package"
 * @generated
 */
public interface FeaturePackage extends EPackage
{
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "feature";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://vitruv.tools/metamodels/change/atomic//feature/1.0";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "feature";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	FeaturePackage eINSTANCE = tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl.init();

	/**
	 * The meta object id for the '{@link tools.vitruv.change.atomic.feature.impl.FeatureEChangeImpl <em>EChange</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see tools.vitruv.change.atomic.feature.impl.FeatureEChangeImpl
	 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getFeatureEChange()
	 * @generated
	 */
	int FEATURE_ECHANGE = 0;

	/**
	 * The feature id for the '<em><b>Affected Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE__AFFECTED_FEATURE = AtomicPackage.ECHANGE_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Affected EObject</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE__AFFECTED_EOBJECT = AtomicPackage.ECHANGE_FEATURE_COUNT + 1;

	/**
	 * The feature id for the '<em><b>Affected EObject ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE__AFFECTED_EOBJECT_ID = AtomicPackage.ECHANGE_FEATURE_COUNT + 2;

	/**
	 * The number of structural features of the '<em>EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE_FEATURE_COUNT = AtomicPackage.ECHANGE_FEATURE_COUNT + 3;

	/**
	 * The operation id for the '<em>Is Resolved</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE___IS_RESOLVED = AtomicPackage.ECHANGE___IS_RESOLVED;

	/**
	 * The number of operations of the '<em>EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int FEATURE_ECHANGE_OPERATION_COUNT = AtomicPackage.ECHANGE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link tools.vitruv.change.atomic.feature.impl.UpdateMultiValuedFeatureEChangeImpl <em>Update Multi Valued Feature EChange</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see tools.vitruv.change.atomic.feature.impl.UpdateMultiValuedFeatureEChangeImpl
	 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUpdateMultiValuedFeatureEChange()
	 * @generated
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE = 1;

	/**
	 * The feature id for the '<em><b>Affected Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE__AFFECTED_FEATURE = FEATURE_ECHANGE__AFFECTED_FEATURE;

	/**
	 * The feature id for the '<em><b>Affected EObject</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE__AFFECTED_EOBJECT = FEATURE_ECHANGE__AFFECTED_EOBJECT;

	/**
	 * The feature id for the '<em><b>Affected EObject ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE__AFFECTED_EOBJECT_ID = FEATURE_ECHANGE__AFFECTED_EOBJECT_ID;

	/**
	 * The number of structural features of the '<em>Update Multi Valued Feature EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE_FEATURE_COUNT = FEATURE_ECHANGE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>Is Resolved</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE___IS_RESOLVED = FEATURE_ECHANGE___IS_RESOLVED;

	/**
	 * The number of operations of the '<em>Update Multi Valued Feature EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_MULTI_VALUED_FEATURE_ECHANGE_OPERATION_COUNT = FEATURE_ECHANGE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link tools.vitruv.change.atomic.feature.impl.UpdateSingleValuedFeatureEChangeImpl <em>Update Single Valued Feature EChange</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see tools.vitruv.change.atomic.feature.impl.UpdateSingleValuedFeatureEChangeImpl
	 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUpdateSingleValuedFeatureEChange()
	 * @generated
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE = 2;

	/**
	 * The feature id for the '<em><b>Affected Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE__AFFECTED_FEATURE = FEATURE_ECHANGE__AFFECTED_FEATURE;

	/**
	 * The feature id for the '<em><b>Affected EObject</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE__AFFECTED_EOBJECT = FEATURE_ECHANGE__AFFECTED_EOBJECT;

	/**
	 * The feature id for the '<em><b>Affected EObject ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE__AFFECTED_EOBJECT_ID = FEATURE_ECHANGE__AFFECTED_EOBJECT_ID;

	/**
	 * The number of structural features of the '<em>Update Single Valued Feature EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE_FEATURE_COUNT = FEATURE_ECHANGE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>Is Resolved</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE___IS_RESOLVED = FEATURE_ECHANGE___IS_RESOLVED;

	/**
	 * The number of operations of the '<em>Update Single Valued Feature EChange</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UPDATE_SINGLE_VALUED_FEATURE_ECHANGE_OPERATION_COUNT = FEATURE_ECHANGE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link tools.vitruv.change.atomic.feature.impl.UnsetFeatureImpl <em>Unset Feature</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see tools.vitruv.change.atomic.feature.impl.UnsetFeatureImpl
	 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUnsetFeature()
	 * @generated
	 */
	int UNSET_FEATURE = 3;

	/**
	 * The feature id for the '<em><b>Affected Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE__AFFECTED_FEATURE = FEATURE_ECHANGE__AFFECTED_FEATURE;

	/**
	 * The feature id for the '<em><b>Affected EObject</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE__AFFECTED_EOBJECT = FEATURE_ECHANGE__AFFECTED_EOBJECT;

	/**
	 * The feature id for the '<em><b>Affected EObject ID</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE__AFFECTED_EOBJECT_ID = FEATURE_ECHANGE__AFFECTED_EOBJECT_ID;

	/**
	 * The number of structural features of the '<em>Unset Feature</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE_FEATURE_COUNT = FEATURE_ECHANGE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>Is Resolved</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE___IS_RESOLVED = FEATURE_ECHANGE___IS_RESOLVED;

	/**
	 * The number of operations of the '<em>Unset Feature</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UNSET_FEATURE_OPERATION_COUNT = FEATURE_ECHANGE_OPERATION_COUNT + 0;


	/**
	 * Returns the meta object for class '{@link tools.vitruv.change.atomic.feature.FeatureEChange <em>EChange</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>EChange</em>'.
	 * @see tools.vitruv.change.atomic.feature.FeatureEChange
	 * @generated
	 */
	EClass getFeatureEChange();

	/**
	 * Returns the meta object for the reference '{@link tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedFeature <em>Affected Feature</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Affected Feature</em>'.
	 * @see tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedFeature()
	 * @see #getFeatureEChange()
	 * @generated
	 */
	EReference getFeatureEChange_AffectedFeature();

	/**
	 * Returns the meta object for the reference '{@link tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedEObject <em>Affected EObject</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Affected EObject</em>'.
	 * @see tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedEObject()
	 * @see #getFeatureEChange()
	 * @generated
	 */
	EReference getFeatureEChange_AffectedEObject();

	/**
	 * Returns the meta object for the attribute '{@link tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedEObjectID <em>Affected EObject ID</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Affected EObject ID</em>'.
	 * @see tools.vitruv.change.atomic.feature.FeatureEChange#getAffectedEObjectID()
	 * @see #getFeatureEChange()
	 * @generated
	 */
	EAttribute getFeatureEChange_AffectedEObjectID();

	/**
	 * Returns the meta object for class '{@link tools.vitruv.change.atomic.feature.UpdateMultiValuedFeatureEChange <em>Update Multi Valued Feature EChange</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Update Multi Valued Feature EChange</em>'.
	 * @see tools.vitruv.change.atomic.feature.UpdateMultiValuedFeatureEChange
	 * @generated
	 */
	EClass getUpdateMultiValuedFeatureEChange();

	/**
	 * Returns the meta object for class '{@link tools.vitruv.change.atomic.feature.UpdateSingleValuedFeatureEChange <em>Update Single Valued Feature EChange</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Update Single Valued Feature EChange</em>'.
	 * @see tools.vitruv.change.atomic.feature.UpdateSingleValuedFeatureEChange
	 * @generated
	 */
	EClass getUpdateSingleValuedFeatureEChange();

	/**
	 * Returns the meta object for class '{@link tools.vitruv.change.atomic.feature.UnsetFeature <em>Unset Feature</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Unset Feature</em>'.
	 * @see tools.vitruv.change.atomic.feature.UnsetFeature
	 * @generated
	 */
	EClass getUnsetFeature();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	FeatureFactory getFeatureFactory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals
	{
		/**
		 * The meta object literal for the '{@link tools.vitruv.change.atomic.feature.impl.FeatureEChangeImpl <em>EChange</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see tools.vitruv.change.atomic.feature.impl.FeatureEChangeImpl
		 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getFeatureEChange()
		 * @generated
		 */
		EClass FEATURE_ECHANGE = eINSTANCE.getFeatureEChange();

		/**
		 * The meta object literal for the '<em><b>Affected Feature</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference FEATURE_ECHANGE__AFFECTED_FEATURE = eINSTANCE.getFeatureEChange_AffectedFeature();

		/**
		 * The meta object literal for the '<em><b>Affected EObject</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference FEATURE_ECHANGE__AFFECTED_EOBJECT = eINSTANCE.getFeatureEChange_AffectedEObject();

		/**
		 * The meta object literal for the '<em><b>Affected EObject ID</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute FEATURE_ECHANGE__AFFECTED_EOBJECT_ID = eINSTANCE.getFeatureEChange_AffectedEObjectID();

		/**
		 * The meta object literal for the '{@link tools.vitruv.change.atomic.feature.impl.UpdateMultiValuedFeatureEChangeImpl <em>Update Multi Valued Feature EChange</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see tools.vitruv.change.atomic.feature.impl.UpdateMultiValuedFeatureEChangeImpl
		 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUpdateMultiValuedFeatureEChange()
		 * @generated
		 */
		EClass UPDATE_MULTI_VALUED_FEATURE_ECHANGE = eINSTANCE.getUpdateMultiValuedFeatureEChange();

		/**
		 * The meta object literal for the '{@link tools.vitruv.change.atomic.feature.impl.UpdateSingleValuedFeatureEChangeImpl <em>Update Single Valued Feature EChange</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see tools.vitruv.change.atomic.feature.impl.UpdateSingleValuedFeatureEChangeImpl
		 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUpdateSingleValuedFeatureEChange()
		 * @generated
		 */
		EClass UPDATE_SINGLE_VALUED_FEATURE_ECHANGE = eINSTANCE.getUpdateSingleValuedFeatureEChange();

		/**
		 * The meta object literal for the '{@link tools.vitruv.change.atomic.feature.impl.UnsetFeatureImpl <em>Unset Feature</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see tools.vitruv.change.atomic.feature.impl.UnsetFeatureImpl
		 * @see tools.vitruv.change.atomic.feature.impl.FeaturePackageImpl#getUnsetFeature()
		 * @generated
		 */
		EClass UNSET_FEATURE = eINSTANCE.getUnsetFeature();

	}

} //FeaturePackage
