# Evaluating Model Differencing for the Consistency Preservation of State-based Views

This repository serves as a replication package for the results discussed in the paper _Evaluating Model Differencing for the Consistency Preservation of State-based Views_.
The paper is published at the 19th European Conference on Modelling Foundations and Applications (ECMFA 2023).

Besides the evolution scenarios described in the paper (`AdvancedSuite`), there are further smaller test cases to check the model differencing against.


### How to use this code

1. Apply the modifications in `overrides/` to both vitruv projects `Vitruv/` and `Vitruv-CaseStudies/` (see `overrides/readme.md`)
2. Import `tests/tools.vitruv.applications.external.umljava.tests/` as plugin project into an instance of the Eclipse Modeling Tools
3. Run the test cases in `src/tools/vitruv/applications/external/umljava/tests/` as Eclipse plugin tests
