#!/bin/bash

# 1. Define your specific RMM Agent Token
RMMAgentToken="b95abc41-e8c9-4044-9dc5-53f9410d0f14"

# 2. Construct the Download URL (Cleaned up trailing quote)
DownloadPath="https://prod.setup.itsupport247.net/darwin/DPMA/64/CWRMM/PKG/setup.pkg?token=${RMMAgentToken}"

# 3. Define the local path ensuring 'TKN' is placed before the token in the filename
LocalPath="/tmp/setupTKN${RMMAgentToken}.pkg"

echo "Downloading ConnectWise RMM Agent..."
# Added -sS flags to keep curl output clean but show errors if it fails
curl -L -o "$LocalPath" "$DownloadPath"

echo "Installing Agent from token-named file..."
# Standard macOS installer binary execution
sudo installer -pkg "$LocalPath" -target /

# 4. Clean up the installer payload
if [ -f "$LocalPath" ]; then
    rm "$LocalPath"
    echo "Temporary installer file cleaned up."
fi

echo "Installation complete."
