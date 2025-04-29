#!/bin/bash
# Installing GetContacts

# 1. Create a Conda environment:
echo "Creating Conda environment 'getcontact' with Python 2.7..."
conda create -n getcontact python=2.7 -y  # Added -y to auto-confirm
if [ $? -ne 0 ]; then
  echo "Error: Failed to create Conda environment."
  exit 1
fi

# 2. Activate the Conda environment:
echo "Activating Conda environment 'getcontact'..."
conda activate getcontact
if [ $? -ne 0 ]; then
  echo "Error: Failed to activate Conda environment."
  exit 1
fi

# 3. Install required packages:
echo "Installing required packages (scipy, numpy, scikit-learn, matplotlib, pandas, cython, vmd-python)..."
conda install scipy numpy scikit-learn matplotlib pandas cython -y # Added -y
if [ $? -ne 0 ]; then
  echo "Error: Failed to install basic scientific packages."
  exit 1
fi

conda install conda-forge/label/cf202003::vmd-python -y # Added -y
if [ $? -ne 0 ]; then
  echo "Error: Failed to install vmd-python."
  exit 1
fi

# 4. Clone the GetContacts repository:
echo "Cloning the GetContacts repository from GitHub..."
git clone https://github.com/getcontacts/getcontacts.git
if [ $? -ne 0 ]; then
  echo "Error: Failed to clone the GetContacts repository."
  exit 1
fi

# 5. Change directory to the GetContacts folder:
echo "Changing directory to 'getcontacts'..."
cd getcontacts
if [ $? -ne 0 ]; then
  echo "Error: Failed to change directory to 'getcontacts'."
  exit 1
fi

# 6. Make the Python scripts executable:
echo "Making Python scripts executable..."
chmod +x *.py
if [ $? -ne 0 ]; then
  echo "Error: Failed to set execute permissions on Python scripts."
  exit 1
fi

echo "GetContacts installation complete!"
