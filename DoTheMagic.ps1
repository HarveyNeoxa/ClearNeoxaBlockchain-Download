# Set the URL and filename for the neoxa-qt-win64.zip file
$url = "https://github.com/NeoxaChain/Neoxa/releases/download/v1.0.3/neoxa-qt-win64.zip"
$filename = "neoxa-qt-win64.zip"

# Set the path for the destination folder on the desktop
$destination = "$env:USERPROFILE\Desktop\neoxa-qt-win64"

# Download the neoxa-qt-win64.zip file and extract it to the destination folder
Invoke-WebRequest -Uri $url -OutFile $filename
Expand-Archive -LiteralPath $filename -DestinationPath $destination -Force

# Delete all files in %AppData%\Neoxa except wallet.dat
$neoxaFolder = "$env:APPDATA\Neoxa"
Get-ChildItem $neoxaFolder | Where-Object { $_.Name -ne "wallet.dat" } | Remove-Item -Recurse -Force

# Remove the neoxa-qt-win64.zip file
Remove-Item $filename

# Display a message to indicate the script has finished running
Write-Host "Done."
