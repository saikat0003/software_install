#!/bin/bash

# Set variables
ZOTERO_URL="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=7.0.7"  # Replace this with the latest version if needed
ZOTERO_DIR="/opt/zotero"
ZOTERO_DESKTOP="$HOME/.local/share/applications/zotero.desktop"

# Download Zotero tarball
echo "Downloading Zotero..."
wget -O zotero.tar.bz2 "$ZOTERO_URL"

# Extract the tarball
echo "Extracting Zotero..."
sudo tar -xjf zotero.tar.bz2 -C /opt/

# Rename the extracted folder to a standard name
sudo mv /opt/Zotero_linux-x86_64 $ZOTERO_DIR

# Clean up the tarball
rm zotero.tar.bz2

# Set launcher icon by running the included script
echo "Setting up the launcher icon..."
cd $ZOTERO_DIR
sudo ./set_launcher_icon

# Create a symlink to the .desktop file
echo "Creating symlink for the .desktop file..."
mkdir -p ~/.local/share/applications
ln -sf $ZOTERO_DIR/zotero.desktop $ZOTERO_DESKTOP

# Make Zotero executable
echo "Making Zotero executable..."
sudo chmod +x $ZOTERO_DIR/zotero

# Optional: add Zotero to PATH (you can uncomment the line below if you want to run zotero from the terminal without specifying the path)
# echo "Adding Zotero to your PATH..."
# sudo ln -s $ZOTERO_DIR/zotero /usr/local/bin/zotero

echo "Zotero installation complete. You can find Zotero in your Applications or use the launcher."

# Finishing message
echo "Installation successful. Zotero should now appear in your launcher."

