# Overrides

This directory contains projects with minor modifications to their originals (of version 3.0.0) in the [vitruv-tools](https://github.com/vitruv-tools) repositories. These are primarily hotfixes needed for some edge cases of the provided tests. As these hotfixes are currently only scoped for the provided tests, they are not yet mature enough to be integrated into the main repositories.
All modifications are marked with `// ########### OVERRIDE START ###########` and `// ########### OVERRIDE END ###########`.


In the following, we will list all modified files compared to version 3.0.0:

| Project | File | Matching repository | Changed lines
| --- | --- | --- | --- |
| tools.vitruv.change.atomic | [RemoveAtCommand.xtend](bundles/tools.vitruv.change.atomic/src/tools/vitruv/change/atomic/command/RemoveAtCommand.xtend) | [Vitruv-Change](https://github.com/vitruv-tools/Vitruv-Change) | 63-67
| tools.vitruv.framework.views | [DefaultStateBasedChangeResolutionStrategy.xtend](bundles/tools.vitruv.framework.views/src/tools/vitruv/framework/views/changederivation/DefaultStateBasedChangeResolutionStrategy.xtend) | [Vitruv](https://github.com/vitruv-tools/Vitruv) | 113-133 |
| tools.vitruv.applications.umljava | [JavaToUmlMethod.reactions](bundles/tools.vitruv.applications.umljava/src/tools/vitruv/applications/umljava/java2uml/JavaToUmlMethod.reactions) | [Vitruv-CaseStudies](https://github.com/vitruv-tools/Vitruv-CaseStudies) | 333-341 |
| tools.vitruv.applications.umljava | [JavaToUmlTypePropagation.reactions](bundles/tools.vitruv.applications.umljava/src/tools/vitruv/applications/umljava/java2uml/JavaToUmlTypePropagation.reactions) | [Vitruv-CaseStudies](https://github.com/vitruv-tools/Vitruv-CaseStudies) | 62-64
