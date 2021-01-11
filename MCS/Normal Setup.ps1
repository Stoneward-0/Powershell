
# install chrome

Write-Output "Installing Chrome"
$Path = $env:TEMP; $Installer = "chrome_installer.exe"; 
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Path\$Installer
Write-Output "Complete!"
#===============================================
Write-Output "Installing Reader DC"
# Silent install Adobe Reader DC
# https://get.adobe.com/nl/reader/enterprise/

# Path for the workdir
$workdir = "c:\installer\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "$workdir\adobeDC.exe"
Invoke-WebRequest $source -OutFile $destination

# Start the installation

Start-Process -FilePath "$workdir\adobeDC.exe" -ArgumentList "/sPB /rs"

# Wait XX Seconds for the installation to finish

Start-Sleep -s 35

# Remove the installer

Remove-Item -Force $workdir\adobe*
Write-Output "Complete"
#===============================================

Write-Output "Installing Teamviewer Client"

# Path for the workdir
$workdir = "c:\installer\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }


$source = "https://dl.teamviewer.com/download/version_15x/TeamViewer_Setup.exe"
$destination = $workdir

# download teamviewer installer
Invoke-WebRequest $source -OutFile $destination

# invoke silent install norestart
Start-Process -FilePath "$workdir\TeamViewer_Setup.exe" -ArgumentList "/S /norestart"

Write-Output "Complete"
