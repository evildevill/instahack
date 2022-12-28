# Setup script - InstaHack
# The setup script for the InstaHack tool. This is a pythhon script that automates the installation of the 
# required utilities and modules, and all the important required dependencies for the tool. 
# For linux based devices only.

# Author : Waseem Akram (https://github.com/evildevill/)
# Modified on : December 28, 2022

# This file is part of InstaHack.

import os
import subprocess
import time

# Defining the ANSII color code variables for colored output
RED = "\033[91m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
BLUE = "\033[94m"
RED_REV = "\033[07;91m"
YELLOW_REV = "\033[07;93m"
DEFCOL = "\033[00m"
# Define a list of package managers to check
package_managers = ["apt", "dnf", "yum", "pacman", "emerge", "pkg"]

# Loop through the package managers and check if they are available
package_manager = None
for pm in package_managers:
    if subprocess.run(["which", pm]).returncode == 0:
        package_manager = pm
        break

if package_manager:
    print(f"{GREEN}Detected package manager: {package_manager} {GREEN}")
else:
    print("No package manager detected")

# The main script starts here

# install git
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "git"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "git"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "brew":
    if subprocess.run(["which", "brew"], capture_output=True).returncode == 0:
        try:
            subprocess.run(["brew", "install", "git"])
        except Exception as e:
            print(f"{RED}Error: {e}{DEFCOL}")
    else:
        print(f"{RED}Error: brew not found in PATH.{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")

# clone a instahack repository from github

if not os.path.isdir("instahack"):
    # Clone the repository from GitHub
    try:
        subprocess.run(["git", "clone", "https://github.com/evildevill/instahack.git"])
        os.chdir("instahack")
    except Exception as e:
        print(f"Error: {e}")
else:
    # Navigate to the instahack directory
    try:
        os.chdir("instahack")
    except Exception as e:
        print(f"Error: {e}")

# Install wget
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "wget"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "wget"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "brew":
    if subprocess.run(["which", "brew"], capture_output=True).returncode == 0:
        try:
            subprocess.run(["brew", "install", "wget"])
        except Exception as e:
            print(f"{RED}Error: {e}{DEFCOL}")
    else:
        print(f"{RED}Error: brew not found in PATH.{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")

# Install curl
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "curl"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "curl"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "brew":
    if subprocess.run(["which", "brew"], capture_output=True).returncode == 0:
        try:
            subprocess.run(["brew", "install", "curl"])
        except Exception as e:
            print(f"{RED}Error: {e}{DEFCOL}")
    else:
        print(f"{RED}Error: brew not found in PATH.{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")

# Install lolcat
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "lolcat"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "lolcat"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")


# Install TOR
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "tor"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "tor"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "brew":
    if subprocess.run(["which", "brew"], capture_output=True).returncode == 0:
        try:
            subprocess.run(["brew", "install", "tor"])
        except Exception as e:
            print(f"{RED}Error: {e}{DEFCOL}")
    else:
        print(f"{RED}Error: brew not found in PATH.{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")

# Install python3-venv
if package_manager == "apt":
    try:
        subprocess.run([package_manager, "install", "python3-venv"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "dnf":
    try:
        subprocess.run([package_manager, "install", "python3-venv"])
    except Exception as e:
        print(f"{RED}Error: {e}{DEFCOL}")
elif package_manager == "brew":
    if subprocess.run(["which", "brew"], capture_output=True).returncode == 0:
        try:
            subprocess.run(["brew", "install", "python3-venv"])
        except Exception as e:
            print(f"{RED}Error: {e}{DEFCOL}")
    else:
        print(f"{RED}Error: brew not found in PATH.{DEFCOL}")
else:
    print(f"{RED}Error: Unknown package manager.{DEFCOL}")

# Create a virtual environment
try:
    if package_manager == "apt":
        subprocess.run(["python3", "-m", "venv", "venv"])
    elif package_manager == "dnf":
        subprocess.run(["python3", "-m", "venv", "venv"])
    else:
        raise ValueError(f"Unknown package manager: {package_manager}")
except Exception as e:
    print(f"{RED}Error: {e}{DEFCOL}")

# activate virtual environment 

os.system("source venv/bin/activate")

# Install the requirements
try:
    if package_manager == "apt":
        subprocess.run(["pip3", "install", "-r", "requirements.txt"])
    elif package_manager == "dnf":
        subprocess.run(["pip3", "install", "-r", "requirements.txt"])
    else:
        raise ValueError(f"Unknown package manager: {package_manager}")
except Exception as e:
    print(f"{RED}Error: {e}{DEFCOL}")

# Redirect to the youtube video according to the package manager
try:
    if package_manager == "apt":
        subprocess.run(["firefox", "https://hackerwasii.com/product/", "> /dev/null 2>&1"])
        subprocess.run(["am", "start", "-a", "android.intent.action.VIEW", "-d", "https://hackerwasii.com/product/", "> /dev/null 2>&1"])
    elif package_manager == "dnf":
        subprocess.run(["firefox", "https://hackerwasii.com/product/", "> /dev/null 2>&1"])
    elif package_manager == "pkg":
        subprocess.run(["am", "start", "-a", "android.intent.action.VIEW", "-d", "https://hackerwasii.com/product/", "> /dev/null 2>&1"])
    else:
        raise ValueError(f"Unknown package manager: {package_manager}")
except Exception as e:
    print(f"{RED}Error: {e}{DEFCOL}")

print(f"{GREEN}All Requirements are installed! Now You Can use it.{DEFCOL}")
time.sleep(3)
os.system("bash instahack.sh")

# End of the script