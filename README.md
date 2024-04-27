# Install VSCode on macOS

This script automates the installation of Visual Studio Code on macOS, intelligently selecting the optimal version for your hardware architecture, whether Apple Silicon or Intel.

## Features

- Automatically detects the macOS architecture (Apple Silicon or Intel).
- Downloads and installs the best-suited version of Visual Studio Code:
  - Apple Silicon version for ARM-based Macs.
  - Universal version for Intel-based Macs, ensuring compatibility and performance.
- Adds Visual Studio Code to the system PATH for easy access from the terminal.
- Checks and reports the installation status.

## Prerequisites

Before running this script, ensure that your system has `curl` and `unzip` utilities installed. These are typically pre-installed on macOS but can be installed via Homebrew if missing:

```bash
brew install curl unzip
```

## Installation and Usage

To install Visual Studio Code using this script, follow these steps:

1. Clone this repository to your local machine:
```bash
git clone https://github.com/yourusername/install-vscode.git
cd install-vscode
```
2. Run the script using bash:
```bash
bash install-vscode.sh
```
