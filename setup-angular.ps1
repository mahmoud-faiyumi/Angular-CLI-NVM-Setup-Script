# Display setup progress
Write-Host "Setting up your Angular CLI and NVM environment..." -ForegroundColor Cyan

# Step 1: Check if Node.js is installed
Write-Host "Checking for Node.js installation..." -ForegroundColor Yellow
if (-Not (Get-Command "node" -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js is not installed. Downloading Node.js installer..." -ForegroundColor Red
    $nodeInstallerUrl = "https://nodejs.org/dist/latest/node-v20.5.1-x64.msi"
    $installerPath = "$env:TEMP\node-installer.msi"
    Invoke-WebRequest -Uri $nodeInstallerUrl -OutFile $installerPath
    Start-Process "msiexec.exe" -ArgumentList "/i $installerPath /quiet /norestart" -Wait
    Remove-Item $installerPath
    Write-Host "Node.js installed. Please restart your terminal if this is the first installation." -ForegroundColor Green
} else {
    $nodeVersion = node -v
    Write-Host "Node.js is already installed. Version: $nodeVersion" -ForegroundColor Green
}

# Step 2: Check if Angular CLI is installed
Write-Host "Checking for Angular CLI installation..." -ForegroundColor Yellow
if (-Not (Get-Command "ng" -ErrorAction SilentlyContinue)) {
    Write-Host "Angular CLI is not installed. Installing globally..." -ForegroundColor Red
    npm install -g @angular/cli | Out-Null
    Write-Host "Angular CLI installed successfully!" -ForegroundColor Green
} else {
    $ngVersion = ng version | Select-String -Pattern "Angular CLI:"
    Write-Host "Angular CLI is already installed. $ngVersion" -ForegroundColor Green
}

# Step 3: Check if NVM is installed
Write-Host "Checking for NVM installation..." -ForegroundColor Yellow
if (-Not (Get-Command "nvm" -ErrorAction SilentlyContinue)) {
    Write-Host "NVM is not installed. Downloading NVM installer..." -ForegroundColor Red
    $nvmInstallerUrl = "https://github.com/coreybutler/nvm-windows/releases/download/1.2.2/nvm-setup.exe"
    $installerPath = "$env:TEMP\nvm-setup.exe"
    Invoke-WebRequest -Uri $nvmInstallerUrl -OutFile $installerPath
    Start-Process $installerPath -Wait
    Remove-Item $installerPath
    Write-Host "NVM installed. Please restart your terminal to ensure it is available." -ForegroundColor Green
} else {
    $nvmVersion = nvm --version
    Write-Host "NVM is already installed. Version: $nvmVersion" -ForegroundColor Green
}

# Step 4: Add NVM to PATH
Write-Host "Adding NVM to PATH environment variable..." -ForegroundColor Yellow
$nvmPath = "C:\Program Files\nvm"
if (-Not ($env:Path -like "*$nvmPath*")) {
    [System.Environment]::SetEnvironmentVariable("Path", "$($env:Path);$nvmPath", [System.EnvironmentVariableTarget]::Machine)
    Write-Host "NVM path added to PATH." -ForegroundColor Green
} else {
    Write-Host "NVM path already exists in PATH." -ForegroundColor Green
}

# Step 5: Create a new Angular project
Write-Host "Creating a new Angular project..." -ForegroundColor Cyan
$projectFolder = "C:\Users\$env:USERNAME\Desktop\NewAngularProject"
if (-Not (Test-Path $projectFolder)) {
    New-Item -ItemType Directory -Path $projectFolder -Force | Out-Null
}
Push-Location -Path $projectFolder
if (-Not (Test-Path "$projectFolder\AngularApp")) {
    ng new AngularApp --style=sass --skip-install --routing=false --strict=false --skip-tests | Out-Null
    Write-Host "Angular project created successfully!" -ForegroundColor Green
} else {
    Write-Host "Angular project already exists. Skipping project creation." -ForegroundColor Green
}
Pop-Location

# Step 6: Install Angular project dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Yellow
Push-Location -Path "$projectFolder\AngularApp"
if (-Not (Test-Path "node_modules")) {
    npm install | Out-Null
    Write-Host "Dependencies installed successfully!" -ForegroundColor Green
} else {
    Write-Host "Dependencies are already installed. Skipping." -ForegroundColor Green
}
Pop-Location

# Step 7: Print versions
Write-Host "Printing versions of Node.js, Angular CLI, and NVM..." -ForegroundColor Cyan
$nodeVersion = node -v
$ngVersion = ng version | Select-String -Pattern "Angular CLI:"
$nvmVersion = nvm --version
Write-Host "Node.js Version: $nodeVersion" -ForegroundColor Green
Write-Host $ngVersion -ForegroundColor Green
Write-Host "NVM Version: $nvmVersion" -ForegroundColor Green

# Step 8: Add cool text output for the test
Write-Host "
By Mahmoud Alfaiyumi from IIH Angular course.
" -ForegroundColor Green
$coolText = @"
 █████ █████ █████   █████ ███
░░███ ░░███ ░░███   ░░███ ░███
 ░███  ░███  ░███    ░███ ░███
 ░███  ░███  ░███████████ ░███
 ░███  ░███  ░███░░░░░███ ░███
 ░███  ░███  ░███    ░███ ░░░ 
 █████ █████ █████   █████ ███
░░░░░ ░░░░░ ░░░░░   ░░░░░ ░░░ 


* Angular CLI & NVM Setup Complete! *
You can now use the following commands:
- Create a Component: ng g c [name]
- Build Project: ng build
- Run Project: ng serve

Happy Coding!
"@
Write-Host $coolText

# Final message
Write-Host "Setup complete!" -ForegroundColor Green
