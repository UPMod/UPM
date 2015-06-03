## Branching & Release

### Versioning

For UPM we use an versioning strategy based on [Semver] (http://semver.org/). This means our version numbering is structured `MAJOR.MINOR.PATCH.BUILD`. 

Because this modification is for Arma and backwards compatability is not always possible, our `MAJOR.MINOR.PATCH.BUILD` rules are slightly different. We increment the:

    MAJOR version when we switch to a new arma version (ie Arma 4 or standalone expansion),
    MINOR version when we add new features or large amount of bug fixes.
    PATCH version when a release only contains bug fixes.

### Branching and releases



#### Branching

* New features, bug fixes that are not a hotfix or other work will always be branched off `master` or another branch but never a `Hotfix branch`,`Version branch` or 'Release branch`. 
* Hotfixes are always branched off the `Release branch`
* The release branch is never merged or deleted. Only master or hotfixes are allowed to merge into the `Release branch`. 

#### Branches & Diagram

The **[master branch](https://github.com/upmod/UPM/tree/master)** tracks [live changes](https://github.com/upmod/UPM/commits/master) by our DEV team. 
This is the cutting edge and may be buggy - it may not even compile. 

The **[version branch](https://github.com/upmod/UPM/tree/0.1)** is the intermediate step for testing before release. 3 weeks for our QA-DEV team and 2 weeks for Community.

The **[release branch](https://github.com/upmod/UPM/tree/release)** is extensively tested by our QA-Dev team and Community. Passed all period of test successfully.