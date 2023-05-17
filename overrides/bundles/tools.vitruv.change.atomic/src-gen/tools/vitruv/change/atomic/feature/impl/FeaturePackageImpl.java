/**
 */
package tools.vitruv.change.atomic.feature.impl;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EGenericType;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.emf.ecore.ETypeParameter;
import org.eclipse.emf.ecore.EcorePackage;

import org.eclipse.emf.ecore.impl.EPackageImpl;

import tools.vitruv.change.atomic.AtomicPackage;

import tools.vitruv.change.atomic.eobject.EobjectPackage;

import tools.vitruv.change.atomic.eobject.impl.EobjectPackageImpl;

import tools.vitruv.change.atomic.feature.FeatureEChange;
import tools.vitruv.change.atomic.feature.FeatureFactory;
import tools.vitruv.change.atomic.feature.FeaturePackage;
import tools.vitruv.change.atomic.feature.UnsetFeature;
import tools.vitruv.change.atomic.feature.UpdateMultiValuedFeatureEChange;
import tools.vitruv.change.atomic.feature.UpdateSingleValuedFeatureEChange;

import tools.vitruv.change.atomic.feature.attribute.AttributePackage;

import tools.vitruv.change.atomic.feature.attribute.impl.AttributePackageImpl;

import tools.vitruv.change.atomic.feature.list.ListPackage;

import tools.vitruv.change.atomic.feature.list.impl.ListPackageImpl;

import tools.vitruv.change.atomic.feature.reference.ReferencePackage;

import tools.vitruv.change.atomic.feature.reference.impl.ReferencePackageImpl;

import tools.vitruv.change.atomic.feature.single.SinglePackage;

import tools.vitruv.change.atomic.feature.single.impl.SinglePackageImpl;

import tools.vitruv.change.atomic.impl.AtomicPackageImpl;

import tools.vitruv.change.atomic.root.RootPackage;

import tools.vitruv.change.atomic.root.impl.RootPackageImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class FeaturePackageImpl extends EPackageImpl implements FeaturePackage
{
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass featureEChangeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass updateMultiValuedFeatureEChangeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass updateSingleValuedFeatureEChangeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass unsetFeatureEClass = null;

	/**
	 * Creates an instance of the model <b>Package</b>, registered with
	 * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
	 * package URI value.
	 * <p>Note: the correct way to create the package is via the static
	 * factory method {@link #init init()}, which also performs
	 * initialization of the package, or returns the registered package,
	 * if one already exists.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.ecore.EPackage.Registry
	 * @see tools.vitruv.change.atomic.feature.FeaturePackage#eNS_URI
	 * @see #init()
	 * @generated
	 */
	private FeaturePackageImpl()
	{
		super(eNS_URI, FeatureFactory.eINSTANCE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static boolean isInited = false;

	/**
	 * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
	 *
	 * <p>This method is used to initialize {@link FeaturePackage#eINSTANCE} when that field is accessed.
	 * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #eNS_URI
	 * @see #createPackageContents()
	 * @see #initializePackageContents()
	 * @generated
	 */
	public static FeaturePackage init()
	{
		if (isInited) return (FeaturePackage)EPackage.Registry.INSTANCE.getEPackage(FeaturePackage.eNS_URI);

		// Obtain or create and register package
		Object registeredFeaturePackage = EPackage.Registry.INSTANCE.get(eNS_URI);
		FeaturePackageImpl theFeaturePackage = registeredFeaturePackage instanceof FeaturePackageImpl ? (FeaturePackageImpl)registeredFeaturePackage : new FeaturePackageImpl();

		isInited = true;

		// Initialize simple dependencies
		EcorePackage.eINSTANCE.eClass();

		// Obtain or create and register interdependencies
		Object registeredPackage = EPackage.Registry.INSTANCE.getEPackage(AtomicPackage.eNS_URI);
		AtomicPackageImpl theAtomicPackage = (AtomicPackageImpl)(registeredPackage instanceof AtomicPackageImpl ? registeredPackage : AtomicPackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(EobjectPackage.eNS_URI);
		EobjectPackageImpl theEobjectPackage = (EobjectPackageImpl)(registeredPackage instanceof EobjectPackageImpl ? registeredPackage : EobjectPackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(RootPackage.eNS_URI);
		RootPackageImpl theRootPackage = (RootPackageImpl)(registeredPackage instanceof RootPackageImpl ? registeredPackage : RootPackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(SinglePackage.eNS_URI);
		SinglePackageImpl theSinglePackage = (SinglePackageImpl)(registeredPackage instanceof SinglePackageImpl ? registeredPackage : SinglePackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(ListPackage.eNS_URI);
		ListPackageImpl theListPackage = (ListPackageImpl)(registeredPackage instanceof ListPackageImpl ? registeredPackage : ListPackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(AttributePackage.eNS_URI);
		AttributePackageImpl theAttributePackage = (AttributePackageImpl)(registeredPackage instanceof AttributePackageImpl ? registeredPackage : AttributePackage.eINSTANCE);
		registeredPackage = EPackage.Registry.INSTANCE.getEPackage(ReferencePackage.eNS_URI);
		ReferencePackageImpl theReferencePackage = (ReferencePackageImpl)(registeredPackage instanceof ReferencePackageImpl ? registeredPackage : ReferencePackage.eINSTANCE);

		// Create package meta-data objects
		theFeaturePackage.createPackageContents();
		theAtomicPackage.createPackageContents();
		theEobjectPackage.createPackageContents();
		theRootPackage.createPackageContents();
		theSinglePackage.createPackageContents();
		theListPackage.createPackageContents();
		theAttributePackage.createPackageContents();
		theReferencePackage.createPackageContents();

		// Initialize created meta-data
		theFeaturePackage.initializePackageContents();
		theAtomicPackage.initializePackageContents();
		theEobjectPackage.initializePackageContents();
		theRootPackage.initializePackageContents();
		theSinglePackage.initializePackageContents();
		theListPackage.initializePackageContents();
		theAttributePackage.initializePackageContents();
		theReferencePackage.initializePackageContents();

		// Mark meta-data to indicate it can't be changed
		theFeaturePackage.freeze();

		// Update the registry and return the package
		EPackage.Registry.INSTANCE.put(FeaturePackage.eNS_URI, theFeaturePackage);
		return theFeaturePackage;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getFeatureEChange()
	{
		return featureEChangeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getFeatureEChange_AffectedFeature()
	{
		return (EReference)featureEChangeEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getFeatureEChange_AffectedEObject()
	{
		return (EReference)featureEChangeEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getFeatureEChange_AffectedEObjectID()
	{
		return (EAttribute)featureEChangeEClass.getEStructuralFeatures().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getUpdateMultiValuedFeatureEChange()
	{
		return updateMultiValuedFeatureEChangeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getUpdateSingleValuedFeatureEChange()
	{
		return updateSingleValuedFeatureEChangeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getUnsetFeature()
	{
		return unsetFeatureEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public FeatureFactory getFeatureFactory()
	{
		return (FeatureFactory)getEFactoryInstance();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isCreated = false;

	/**
	 * Creates the meta-model objects for the package.  This method is
	 * guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void createPackageContents()
	{
		if (isCreated) return;
		isCreated = true;

		// Create classes and their features
		featureEChangeEClass = createEClass(FEATURE_ECHANGE);
		createEReference(featureEChangeEClass, FEATURE_ECHANGE__AFFECTED_FEATURE);
		createEReference(featureEChangeEClass, FEATURE_ECHANGE__AFFECTED_EOBJECT);
		createEAttribute(featureEChangeEClass, FEATURE_ECHANGE__AFFECTED_EOBJECT_ID);

		updateMultiValuedFeatureEChangeEClass = createEClass(UPDATE_MULTI_VALUED_FEATURE_ECHANGE);

		updateSingleValuedFeatureEChangeEClass = createEClass(UPDATE_SINGLE_VALUED_FEATURE_ECHANGE);

		unsetFeatureEClass = createEClass(UNSET_FEATURE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isInitialized = false;

	/**
	 * Complete the initialization of the package and its meta-model.  This
	 * method is guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void initializePackageContents()
	{
		if (isInitialized) return;
		isInitialized = true;

		// Initialize package
		setName(eNAME);
		setNsPrefix(eNS_PREFIX);
		setNsURI(eNS_URI);

		// Obtain other dependent packages
		SinglePackage theSinglePackage = (SinglePackage)EPackage.Registry.INSTANCE.getEPackage(SinglePackage.eNS_URI);
		ListPackage theListPackage = (ListPackage)EPackage.Registry.INSTANCE.getEPackage(ListPackage.eNS_URI);
		AttributePackage theAttributePackage = (AttributePackage)EPackage.Registry.INSTANCE.getEPackage(AttributePackage.eNS_URI);
		ReferencePackage theReferencePackage = (ReferencePackage)EPackage.Registry.INSTANCE.getEPackage(ReferencePackage.eNS_URI);
		EcorePackage theEcorePackage = (EcorePackage)EPackage.Registry.INSTANCE.getEPackage(EcorePackage.eNS_URI);
		AtomicPackage theAtomicPackage = (AtomicPackage)EPackage.Registry.INSTANCE.getEPackage(AtomicPackage.eNS_URI);

		// Add subpackages
		getESubpackages().add(theSinglePackage);
		getESubpackages().add(theListPackage);
		getESubpackages().add(theAttributePackage);
		getESubpackages().add(theReferencePackage);

		// Create type parameters
		ETypeParameter featureEChangeEClass_A = addETypeParameter(featureEChangeEClass, "A");
		ETypeParameter featureEChangeEClass_F = addETypeParameter(featureEChangeEClass, "F");
		ETypeParameter updateMultiValuedFeatureEChangeEClass_A = addETypeParameter(updateMultiValuedFeatureEChangeEClass, "A");
		ETypeParameter updateMultiValuedFeatureEChangeEClass_F = addETypeParameter(updateMultiValuedFeatureEChangeEClass, "F");
		ETypeParameter updateSingleValuedFeatureEChangeEClass_A = addETypeParameter(updateSingleValuedFeatureEChangeEClass, "A");
		ETypeParameter updateSingleValuedFeatureEChangeEClass_F = addETypeParameter(updateSingleValuedFeatureEChangeEClass, "F");
		ETypeParameter unsetFeatureEClass_A = addETypeParameter(unsetFeatureEClass, "A");
		ETypeParameter unsetFeatureEClass_F = addETypeParameter(unsetFeatureEClass, "F");

		// Set bounds for type parameters
		EGenericType g1 = createEGenericType(theEcorePackage.getEObject());
		featureEChangeEClass_A.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEStructuralFeature());
		featureEChangeEClass_F.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEObject());
		updateMultiValuedFeatureEChangeEClass_A.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEStructuralFeature());
		updateMultiValuedFeatureEChangeEClass_F.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEObject());
		updateSingleValuedFeatureEChangeEClass_A.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEStructuralFeature());
		updateSingleValuedFeatureEChangeEClass_F.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEObject());
		unsetFeatureEClass_A.getEBounds().add(g1);
		g1 = createEGenericType(theEcorePackage.getEStructuralFeature());
		unsetFeatureEClass_F.getEBounds().add(g1);

		// Add supertypes to classes
		featureEChangeEClass.getESuperTypes().add(theAtomicPackage.getEChange());
		g1 = createEGenericType(this.getFeatureEChange());
		EGenericType g2 = createEGenericType(updateMultiValuedFeatureEChangeEClass_A);
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(updateMultiValuedFeatureEChangeEClass_F);
		g1.getETypeArguments().add(g2);
		updateMultiValuedFeatureEChangeEClass.getEGenericSuperTypes().add(g1);
		g1 = createEGenericType(this.getFeatureEChange());
		g2 = createEGenericType(updateSingleValuedFeatureEChangeEClass_A);
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(updateSingleValuedFeatureEChangeEClass_F);
		g1.getETypeArguments().add(g2);
		updateSingleValuedFeatureEChangeEClass.getEGenericSuperTypes().add(g1);
		g1 = createEGenericType(this.getFeatureEChange());
		g2 = createEGenericType(unsetFeatureEClass_A);
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(unsetFeatureEClass_F);
		g1.getETypeArguments().add(g2);
		unsetFeatureEClass.getEGenericSuperTypes().add(g1);

		// Initialize classes, features, and operations; add parameters
		initEClass(featureEChangeEClass, FeatureEChange.class, "FeatureEChange", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		g1 = createEGenericType(featureEChangeEClass_F);
		initEReference(getFeatureEChange_AffectedFeature(), g1, null, "affectedFeature", null, 1, 1, FeatureEChange.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
		g1 = createEGenericType(featureEChangeEClass_A);
		initEReference(getFeatureEChange_AffectedEObject(), g1, null, "affectedEObject", null, 1, 1, FeatureEChange.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
		initEAttribute(getFeatureEChange_AffectedEObjectID(), theAtomicPackage.getId(), "affectedEObjectID", null, 0, 1, FeatureEChange.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

		initEClass(updateMultiValuedFeatureEChangeEClass, UpdateMultiValuedFeatureEChange.class, "UpdateMultiValuedFeatureEChange", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(updateSingleValuedFeatureEChangeEClass, UpdateSingleValuedFeatureEChange.class, "UpdateSingleValuedFeatureEChange", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(unsetFeatureEClass, UnsetFeature.class, "UnsetFeature", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
	}

} //FeaturePackageImpl
