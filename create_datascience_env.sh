#!/bin/bash

# Name of the virtual environment
ENV_NAME="${1:-datascience_env}"  # Use first argument if provided, otherwise default

# Python version
PYTHON_VERSION="python3"

# Check if venv module is available
if ! "$PYTHON_VERSION" -c "import venv" &> /dev/null; then
    echo "Python venv module not found. Please ensure you have Python 3.3+ installed."
    exit 1
fi

# Create a virtual environment
echo "Creating virtual environment: $ENV_NAME"
"$PYTHON_VERSION" -m venv "$ENV_NAME"

# Activate the virtual environment
source "$ENV_NAME/bin/activate"

# Upgrade pip
pip install --upgrade pip

# List of common data science packages to install
PACKAGES=(
    numpy
    pandas
    scipy
    matplotlib
    seaborn
    scikit-learn
    jupyter
    jupyterlab
    openpyxl  # Add this for Excel support
    statsmodels
    xgboost
    lightgbm
)

# Install packages (using proper array expansion)
echo "Installing data science packages..."
for package in "${PACKAGES[@]}"; do
    pip install "$package"
done

echo "Data science Python environment setup complete!"
echo "To activate the environment, use: source $ENV_NAME/bin/activate"
