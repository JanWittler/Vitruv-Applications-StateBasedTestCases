package tools.vitruv.applications.external.umljava.tests.util

import edu.kit.ipd.sdq.activextendannotations.Utility
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource

import static org.hamcrest.CoreMatchers.*
import static org.hamcrest.MatcherAssert.assertThat
import org.eclipse.uml2.uml.PackageableElement

@Utility
class UmlEqualityHelper {
    static def void assertIsEqual(Resource reference, Resource actual) {
        if (reference instanceof UMLResource && actual instanceof UMLResource) {
            val umlReference = reference as UMLResource
            val umlActual = actual as UMLResource
            if (!umlReference.contents.isEmpty && !umlActual.contents.isEmpty) {
                assertIsEqual(umlReference.contents.head as Model, umlActual.contents.head as Model)
            }
        }
    }

    static def void assertIsEqual(Package reference, Package actual) {
        assertIsEqualNamedElement(reference, actual)
        assertThat("different number of children", actual.packagedElements.size, is(reference.packagedElements.size))
        zip("packaged elements", reference.packagedElements, actual.packagedElements) [ r, a |
            assertIsEqual(r, a)
        ]
    }

    private static def void assertIsEqual(PackageableElement reference, PackageableElement actual) {
        if (reference instanceof Package && actual instanceof Package) {
            assertIsEqual(reference as Package, actual as Package)
        } else if (reference instanceof Class && actual instanceof Class) {
            assertIsEqual(reference as Class, actual as Class)
        } else if (reference instanceof Association && actual instanceof Association) {
            assertIsEqual(reference as Association, actual as Association)
        } else {
            assertThat("invalid elements", false, is(true))
        }
    }

    private static def void assertIsEqual(Class reference, Class actual) {
        assertIsEqualNamedElement(reference, actual)
        zip("operations", reference.ownedOperations, actual.ownedOperations) [ r, a |
            assertIsEqual(r, a)
        ]
        zip("attributes", reference.ownedAttributes, actual.ownedAttributes) [ r, a |
            assertIsEqual(r, a)
        ]
    }

    private static def void assertIsEqual(Association reference, Association actual) {
        if (reference.memberEnds.size == 2 && actual.memberEnds.size == 2 &&
            reference.memberEnds.get(0).name == actual.memberEnds.get(1).name) {
            assertIsEqual(reference.memberEnds.get(0), actual.memberEnds.get(1))
            assertIsEqual(reference.memberEnds.get(1), actual.memberEnds.get(0))
        } else {
            zip("memberEnds", reference.memberEnds, actual.memberEnds) [ r, a |
                assertIsEqual(r, a)
            ]
        }
    }

    private static def void assertIsEqual(Operation reference, Operation actual) {
        assertIsEqualNamedElement(reference, actual)
        zip("parameters", reference.ownedParameters, actual.ownedParameters) [ r, a |
            assertIsEqual(r, a)
        ]
    }

    private static def void assertIsEqual(Parameter reference, Parameter actual) {
        assertIsEqualNamedElement(reference, actual)
        assertIsEqual(reference.type, actual.type)
    }

    private static def void assertIsEqual(Property reference, Property actual) {
        assertIsEqualNamedElement(reference, actual)
        assertIsEqual(reference.type, actual.type)
    }

    private static def void assertIsEqual(Type reference, Type actual) {
        assertThat("different type classes", actual.eClass, is(reference.eClass))
        assertIsEqualNamedElement(reference, actual)
    }

    private static def assertIsEqualNamedElement(NamedElement reference, NamedElement actual) {
        assertThat("wrong element name", actual.name, is(reference.name))
        assertThat("wrong visibility", actual.visibility, is(reference.visibility))
    }

    private static def <E> zip(String elementType, Iterable<E> reference, Iterable<E> actual, (E, E)=>void function) {
        assertThat("different number of " + elementType, actual.size, is(reference.size))
        var referenceIterator = reference.iterator
        var actualIterator = actual.iterator
        while (referenceIterator.hasNext && actualIterator.hasNext) {
            function.apply(referenceIterator.next, actualIterator.next)
        }
    }
}
