#!/bin/bash

# Define the GitHub Gist URL and the local script filename
GIST_URL="https://gist.github.com/kacole2/95e83ac84fec950b1a70b0853d6594dc/raw/harbor.sh"
SCRIPT_NAME="harbor.sh"

# Download the Harbor installation script
echo "Downloading the Harbor installation script..."
curl -s -o $SCRIPT_NAME $GIST_URL

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to download the Harbor installation script."
  exit 1
fi

# Grant run permissions to the script
echo "Granting execute permissions to the script..."
chmod u+x $SCRIPT_NAME

# Run the script as superuser
echo "Running the Harbor installation script..."
sudo ./$SCRIPT_NAME

# Check if the script execution was successful
if [ $? -ne 0 ]; then
  echo "Error: Harbor installation script failed."
  exit 1
fi

echo "Harbor installation script completed successfully."
