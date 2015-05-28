#!/usr/bin/env python3

#######################
#  UPM Setup Script  #
#######################


import os
import sys
import shutil
import platform
import subprocess
import winreg


def main():
    print("""
  ######################################
  # UPM Development Environment Setup #
  ######################################

  This script will create your UPM dev environment for you.
  
  Before you run this, you should already have:
    - The Arma 3 Tools installed properly via Steam
    - A properly set up P-drive
  
  If you have not done those things yet, please abort this script in the next step and do so first.
  
  This script will create two hard links on your system, both pointing to your UPM project folder:
    [Arma 3 installation directory]\\u\\upm => UPM project folder
    P:\\u\\upm                              => UPM project folder
  
  It will also copy the required CBA includes to P:\\x\\cba, if you do not have the CBA source code already.""")
    print("\n") 

    try:
        reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)
        try:
            key = winreg.OpenKey(reg,
                r"SOFTWARE\Wow6432Node\bohemia interactive\arma 3")
        except:
            key = winreg.OpenKey(reg,
                r"SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 3")
        armapath = winreg.QueryValueEx(key, "main")[0]
    except:
        print("Failed to determine Arma 3 Path.")
        return 1

    if not os.path.exists("P:\\"):
        print("No P-drive detected.")
        return 2

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))

    print("# Detected Paths:")
    print("  Arma Path:    {}".format(armapath))
    print("  Project Path: {}".format(projectpath))

    repl = input("\nAre these correct? (y/n): ")
    if repl.lower() != "y":
        return 3

    print("\n# Creating links ...")

    if os.path.exists("P:\\u\\upm"):
        print("Link on P: already exists. Please finish the setup manually.")
        return 4

    if os.path.exists(os.path.join(armapath, "u", "upm")):
        print("Link in Arma directory already exists. Please finish the setup manually.")
        return 5

    try:
        if not os.path.exists("P:\\u"):
            os.mkdir("P:\\u")
        if not os.path.exists(os.path.join(armapath, "u")):
            os.mkdir(os.path.join(armapath, "u"))

        if platform.win32_ver()[0] == "7":
            subprocess.call(["cmd", "/c", "mklink", "/D", "P:\\u\\upm", projectpath])
            subprocess.call(["cmd", "/c", "mklink", "/D", os.path.join(armapath, "u", "upm"), projectpath])
        else:
            subprocess.call(["cmd", "/c", "mklink", "/D", "/J", "P:\\u\\upm", projectpath])
            subprocess.call(["cmd", "/c", "mklink", "/D", "/J", os.path.join(armapath, "u", "upm"), projectpath])
    except:
        raise
        print("Something went wrong during the link creation. Please finish the setup manually.")
        return 6

    print("# Links created successfully.")


    print("\n# Copying required CBA includes ...")

    if os.path.exists("P:\\x\\cba"):
        print("P:\\x\\cba already exists, skipping.")
        return -1

    try:
        shutil.copytree(os.path.join(projectpath, "tools_project", "required", "cba"), "P:\\x\\cba")
    except:
        raise
        print("Something went wrong while copying CBA includes. Please copy required\\cba to P:\\x\\cba manually.")
        return 7

    print("# CBA includes copied successfully to P:\\x\\cba.")

    return 0


if __name__ == "__main__":
    exitcode = main()

    if exitcode > 0:
        print("\nSomething went wrong during the setup. Make sure you run this script as administrator. If these issues persist, please follow the instructions on the UPM wiki to perform the setup manually.")
    else:
        print("\nSetup successfully completed.")

    input("\nPress enter to exit ...\n")
    sys.exit(exitcode)