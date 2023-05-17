# Evaluating Model Differencing for the Consistency Preservation of State-based Views
[![DOI](https://zenodo.org/badge/488912606.svg)](https://zenodo.org/badge/latestdoi/488912606)

This repository serves as a replication package for the results discussed in the paper _Evaluating Model Differencing for the Consistency Preservation of State-based Views_.
The paper is published at the 19th European Conference on Modelling Foundations and Applications (ECMFA 2023).

Besides the evolution scenarios described in the paper (`AdvancedSuite`), there are further smaller test cases to check the model differencing against.


### How to use this code

1. Install Eclipse 2022-06 in the [Eclipse Modeling Tools](https://www.eclipse.org/downloads/packages/release/2022-06/r/eclipse-modeling-tools) version.
2. Install Xtext 2.30.0 from Eclipse Marketplace.
3. Install the following Eclipse Plug-Ins from [KIT SDQ Commons 2.1.0](https://kit-sdq.github.io/updatesite/release/commons/2.1.0):
  - SDQ Commons
4. Install the following Eclipse Plug-Ins from [Vitruv 3.0.0](https://vitruv.tools/updatesite/release/aggregated/3.0.0):
  - Vitruv Applications for Component-based Systems
  - Vitruv Change Sepcification and Propagation
  - Vitruv Consistency Specification Languages
  - Vitruv Consistency Specification Languages Runtimes
  - Vitruv V-SUM Framework
5. Import all projects in `tests` and `overrides/bundles` into Eclipse.
6. Run the test cases in project `tools.vitruv.applications.external.umljava` as JUnit Plug-In tests.
