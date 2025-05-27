#!/bin/bash

# Name of the virtual environment
VENV_NAME="myenv"
PYTHON_VERSION=python3.11

# Detect OS and install virtualenv if needed
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

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

    # Activate the virtual environment
    echo "Activating virtual environment $VENV_NAME"

    . $VENV_NAME/bin/activate
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    #!/bin/bash

    # Function to check if a command exists
    command_exists() {
        command -v "$1" >/dev/null 2>&1
    }

    # Check if Python is installed
    if ! command_exists python3; then
        echo "Python 3 is not installed. Please install Python 3 first."
        echo "You can install it using Homebrew: brew install python"
        exit 1
    fi

    # Set the virtual environment directory name
    VENV_DIR="venv"

    # Check if virtual environment already exists
    if [ -d "$VENV_DIR" ]; then
        echo "Virtual environment '$VENV_DIR' already exists."
    else
        echo "Creating virtual environment in '$VENV_DIR'..."
        python3 -m venv "$VENV_DIR"
        
        # Check if venv creation succeeded
        if [ $? -ne 0 ]; then
            echo "Failed to create virtual environment."
            echo "Trying alternative method with virtualenv..."
            if ! command_exists virtualenv; then
                pip3 install --user virtualenv
            fi
            virtualenv "$VENV_DIR"
            if [ $? -ne 0 ]; then
                echo "Virtual environment creation failed."
                exit 1
            fi
        fi
    fi

    # Activate the virtual environment
    echo "Activating virtual environment..."
    source "$VENV_DIR/bin/activate"

    # Verify the virtual environment is active
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        echo "Virtual environment activated successfully!"
        echo "Python path: $(which python3)"
        echo "Pip path: $(which pip)"
    else
        echo "Failed to activate virtual environment."
        exit 1
fi

# Instructions for deactivation
echo ""
echo "To deactivate the virtual environment later, run: deactivate"
echo "To reactivate, run: source $VENV_DIR/bin/activate"
    
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
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
