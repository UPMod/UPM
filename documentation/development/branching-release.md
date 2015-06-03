## Branching & Release

### Versioning

For UPM we use an versioning strategy based on [Semver] (http://semver.org/). This means our version numbering is structured `MAJOR.MINOR.PATCH.BUILD`. 

Because this modification is for Arma and backwards compatability is not always possible, our `MAJOR.MINOR.PATCH.BUILD` rules are slightly different. We increment the:

    MAJOR version when we switch to a new arma version (ie Arma 4 or standalone expansion),
    MINOR version when we add new features or large amount of bug fixes.
    PATCH version when a release only contains bug fixes.

### Branching and releases

We have a release scheduled every 2 weeks on a Tuesday. On the Friday before release, the project management will decide whether or not this scheduled release will continue. When continuing  with the release, the current `master branch` will be merged into the `release branch`. The release branch will not contain any direct commits and no other branches will be merged into this branch. The exception being `hotfixes`, which are branched off `Release` and merged back into `Release` and `Master`. 

`Hotfixes` are fixes for critical bugs that prevent stable gameplay with the currently available version of ACE3.

During this release process between the Friday and Tuesday, the day of release, work can continue on as normal on the `Master branch`. This includes new features, bug fixes that won't make it for release or other work. These will not be merged into the `Release branch` until the next release cycle, normally 2 weeks later.

#### Branching

* New features, bug fixes that are not a hotfix or other work will always be branched off `master` or another branch but never a `hotfix` or the `Release branch`. 
* Hotfixes are always branched off the `Release branch`
* The release branch is never merged or deleted. Only master or hotfixes are allowed to merge into the `Release branch`. 

#### Branches & Diagram

The **[master branch](https://github.com/upmod/UPM/tree/master)** tracks [live changes](https://github.com/upmod/UPM/commits/master) by our DEV team. 
This is the cutting edge and may be buggy - it may not even compile. 

The **[version branch](https://github.com/upmod/UPM/tree/0.1)** is the intermediate step for testing before release. 3 weeks for our QA-DEV team and 2 weeks for Community.

The **[release branch](https://github.com/upmod/UPM/tree/release)** is extensively tested by our QA-Dev team and Community. Passed all period of test successfully.