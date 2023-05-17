/**
 */
package tools.vitruv.change.atomic.feature.list.impl;

import java.lang.reflect.InvocationTargetException;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;

import tools.vitruv.change.atomic.AtomicPackage;
import tools.vitruv.change.atomic.SubtractiveEChange;

import tools.vitruv.change.atomic.feature.list.ListPackage;
import tools.vitruv.change.atomic.feature.list.RemoveFromListEChange;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Remove From List EChange</b></em>'.
 * <!-- end-user-doc -->
 *
 * @generated
 */
public abstract class RemoveFromListEChangeImpl<A extends EObject, F extends EStructuralFeature, T extends Object> extends UpdateSingleListEntryEChangeImpl<A, F> implements RemoveFromListEChange<A, F, T>
{
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected RemoveFromListEChangeImpl()
	{
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass()
	{
		return ListPackage.Literals.REMOVE_FROM_LIST_ECHANGE;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public T getOldValue()
	{
		// TODO: implement this method
		// Ensure that you remove @generated or mark it @generated NOT
		throw new UnsupportedOperationException();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public int eDerivedOperationID(int baseOperationID, Class<?> baseClass)
	{
		if (baseClass == SubtractiveEChange.class) {
			switch (baseOperationID) {
				case AtomicPackage.SUBTRACTIVE_ECHANGE___GET_OLD_VALUE: return ListPackage.REMOVE_FROM_LIST_ECHANGE___GET_OLD_VALUE;
				default: return -1;
			}
		}
		return super.eDerivedOperationID(baseOperationID, baseClass);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException
	{
		switch (operationID) {
			case ListPackage.REMOVE_FROM_LIST_ECHANGE___GET_OLD_VALUE:
				return getOldValue();
		}
		return super.eInvoke(operationID, arguments);
	}

} //RemoveFromListEChangeImpl
