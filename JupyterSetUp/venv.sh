#!/bin/bash

#run the code with source ./venv.sh

#to run the venv environnement without restarting the script run
#source /myenv/bin/activate

#to download the packages run once the venv environnement
#pip3 install -r requirements.txt

sudo apt install python3-virtualenv

# Name of the virtual environment
VENV_NAME="myenv"
PYTHON_VERSION=python3.11

# Check if venv exists, if not create it
if [ ! -d "$VENV_NAME" ]; then
    echo "Creating virtual environment $VENV_NAME"
    # python3 -m venv $VENV_NAME
    virtualenv --python $PYTHON_VERSION $VENV_NAME
fi

# Check if requirements.txt exists, if not create it
if [ ! -f "requirements.txt" ]; then
    echo "Creating requirements.txt"
    touch requirements.txt
else
    # Install requirements
    echo "Installing requirements"
    $VENV_NAME/bin/pip3 install -r requirements.txt
fi

# Activate the virtual environment
echo "Activating virtual environment $VENV_NAME"

. $VENV_NAME/bin/activate

