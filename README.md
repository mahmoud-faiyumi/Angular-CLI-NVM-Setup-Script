# Angular CLI & NVM Setup Script

## Overview
This PowerShell script automates the installation and setup of Node.js, Angular CLI, and NVM (Node Version Manager) on a Windows system. Additionally, it creates a new Angular project and installs dependencies.

## Features
- Checks for and installs Node.js if not already installed.
- Checks for and installs Angular CLI globally.
- Checks for and installs NVM (Windows version).
- Ensures NVM is added to the system PATH.
- Creates a new Angular project with SCSS styling and default settings.
- Installs Angular project dependencies.
- Displays installed versions of Node.js, Angular CLI, and NVM.
- Provides helpful usage commands for Angular development.

## Prerequisites
- Windows operating system
- PowerShell with administrative privileges
- Active internet connection

## Installation & Usage
1. Open PowerShell as Administrator.
2. Copy and paste the script into a new `.ps1` file (e.g., `setup-angular.ps1`).
3. Run the script using the following command:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; .\setup-angular.ps1
   ```
4. Follow the on-screen instructions.

## Script Breakdown
### Step 1: Node.js Installation
- Checks if Node.js is installed.
- If missing, downloads and installs the latest stable version.

### Step 2: Angular CLI Installation
- Verifies if Angular CLI is installed.
- If missing, installs Angular CLI globally using `npm`.

### Step 3: NVM Installation
- Checks if NVM is installed.
- If missing, downloads and installs NVM for Windows.

### Step 4: NVM Path Configuration
- Ensures NVM is correctly added to the system PATH environment variable.

### Step 5: Angular Project Setup
- Creates a new Angular project on the user's Desktop.
- Configures project settings and initializes files.

### Step 6: Dependency Installation
- Installs required project dependencies using `npm install`.

### Step 7: Version Verification
- Prints the installed versions of Node.js, Angular CLI, and NVM.

### Step 8: Final Message & Usage Guide
- Displays a cool ASCII art banner.
- Provides essential Angular CLI commands for development.

## Example Output
```
Setting up your Angular CLI and NVM environment...
Checking for Node.js installation...
Node.js is already installed. Version: v20.5.1
Checking for Angular CLI installation...
Angular CLI is already installed. Angular CLI: 17.0.2
Checking for NVM installation...
NVM is already installed. Version: 1.2.2
Creating a new Angular project...
Angular project created successfully!
Installing project dependencies...
Dependencies installed successfully!
Setup complete!
```

## Post-Installation Commands
After setup, you can use these commands to start working with Angular:
- **Create a new component:** `ng g c [component-name]`
- **Build the project:** `ng build`
- **Serve the project locally:** `ng serve`

## License
This script is open-source and available for modification. Use it freely to set up your Angular development environment.

## Author
**Mahmoud Alfaiyumi**  
IIH Angular Course

Happy Coding! 🚀

