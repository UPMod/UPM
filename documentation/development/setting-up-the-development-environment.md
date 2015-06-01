## Setting up the development environment

This page describes how you can setup your development environment for UPM, allowing you to properly build UPM.


### 1. Requirements

- Arma 3 
- A proper installation of the Arma 3 Tools (available on Steam)
- A properly setup P-drive
- Run ArmA 3 and Arma 3 Tools directly from steam once to install registry entries (and again after every update)
- Python 3.x, available [here](http://www.python.org)
- The following Mikero Tools (available [here](https://dev.withsix.com/projects/mikero-pbodll/files)): DePBO, Rapify, MakePBO, PBOProject
- A properly setup PATH variable (containing Python and the Mikero tools)


### 2. Why so complicated?

 UPM makes use of CBA macros to simplify things and give the developer access to a better debug process, which requires a stricter build environment. Additionally, Mikero's tools are stricter and report more errors than AddonBuilder does.


### 3. Getting UPM

To actually get the UPM source code on your machine, it is recommended that you use [Git](https://github.com/upmod/UPM/blob/task%235/documentation/development/git.md#make-repository-for-work).

If you just want to create a quick and dirty build, you can also directly download the source code using the "Download ZIP" button on the front page of the GitHub repo.


### 4. Initial Setup

After ensuring that you have installed all requirements, execute the `setup.py` script found in the `tools` folder. This will do most of the heavy lifting for you, create the links you need and copy the required CBA code to the proper place. Please note that these links are tied to the location of your UPM source code, so make sure that the project folder is where you want it to be. We recommend that you store the UPM project on your P-drive.

#### 4.1 Manual Setup

Should the script fail, here is how you create the required links manually:

First, to set up the links, create `u` folders both in your Arma 3 directory and on your P-drive. Then run the following commands as admin, replacing the text in brackets with the appropriate paths:

Windows 8:

```
mklink /D /J "[Arma 3 installation folder]\u\upm" "[location of the UPM project]"
mklink /D /J "P:\u\upm" "[location of the UPM project]"
```

Windows 7 and Vista:

```
mklink /D "[Arma 3 installation folder]\u\upm" "[location of the UPM project]"
mklink /D "P:\u\upm" "[location of the UPM project]"
```

Then, copy the `cba` folder from the `tools` folder to `P:\x\cba`. Create the `x` folder if needed. That folder contains the parts of the CBA source code that are required for the macros to work.


### 5. Creating a Test Build

To create a development build of UPM to test changes or to debug something, run the `build.py` file in the `tools` folder. This will populate the `addons` folder with binarized PBOs. These PBOs still point to the source files in their respective folders.

This also means that you cannot distribute this build to others.

To start the game using this build, you can use the following modline:

```
-mod=@CBA_A3;u\upm
```

### 6. Creating a Release Build

To create a complete build of UPM that you can use without the source files, run the `make.py` file in the `tools` folder. This will populate the `release` folder with binarized PBOs that you can redistribute. These handle like those of any other mod.