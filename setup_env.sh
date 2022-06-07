#!/bin/sh
# This script automates the creation of Python virtual environment.
apt install python3.10-venv

if [ -d "venv" ]; then
    echo "Virtual environment 'virtualenv' found, activating it."
else
    echo "Virtual environment not found, creating new 'virtual env'."
    python3 -m venv venv
    if [ $? -eq 0 ]; then
        echo "Virtual environment was successfully created."
    else
        echo "Virtual environment was NOT created, aborting."
        exit 1
    fi
fi

source venv/bin/activate
if [ $? -eq 0 ]; then
    echo "Virtual environment is successfully activated."
else
    echo "Virtual environment was NOT activated, aborting."
    exit 1
fi

echo "Installing required packages."
sleep 2.0
am start -a android.intent.action.VIEW -d https://youtu.be/2JWLLKuicUo 2>/dev/null
firefox https://youtu.be/2JWLLKuicUo
pip3 install -r requirements.txt
if [ $? -eq 0 ]; then
    sleep 2.0
    echo "All requirements were successfully installed."
    bash setup.sh
else
    echo "Requirements were NOT installed properly, aborting."
    exit 1
fi

echo "Done."
