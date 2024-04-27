#!/bin/bash

# Detect macOS architecture and set the appropriate download URL
ARCH_TYPE="$(uname -m)"
if [ "$ARCH_TYPE" == "arm64" ]; then
    echo "Detected Apple Silicon Mac."
    DOWNLOAD_URL="https://update.code.visualstudio.com/latest/darwin-arm64/stable"
elif [ "$ARCH_TYPE" == "x86_64" ]; then
    echo "Detected Intel Mac."
    DOWNLOAD_URL="https://update.code.visualstudio.com/latest/darwin-universal/stable"
else
    echo "Unsupported processor architecture. This script is intended for macOS only."
    exit 1
fi

# Check if VSCode is installed
if [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "Visual Studio Code is already installed."
else
    # Downloading the version of Visual Studio Code based on the detected architecture
    echo "Downloading Visual Studio Code..."
    curl -L $DOWNLOAD_URL -o vscode.zip

    echo "Unzipping Visual Studio Code..."
    unzip -q vscode.zip -d /Applications
    rm vscode.zip
    echo "Visual Studio Code has been installed."
fi

# Ensure VSCode bin is in PATH
VSCODE_BIN_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if ! grep -q "$VSCODE_BIN_PATH" ~/.zshrc; then
    echo "Adding Visual Studio Code to PATH..."
    echo "export PATH=\"\$PATH:$VSCODE_BIN_PATH\"" >> ~/.zshrc
    export PATH="$PATH:$VSCODE_BIN_PATH"
else
    echo "Visual Studio Code path is already in PATH."
fi

# Check if code command is operational
if ! command -v code &> /dev/null; then
    echo "Failed to add 'code' command to PATH."
else
    echo "Visual Studio Code and 'code' command are successfully installed and operational."
fi