#!/bin/bash

read -p "For using this, you need have NPM in your machine. Do you want to install it? (Y/n)" choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  # Install npm
  sudo dnf install -y npm
fi

# Configure npm to use serve
sudo npm install -g serve

echo "Script installed successfully!"
echo "Now, to use this script, open the terminal in the folder you want to share contant (cd /folder/to/share) and just run 'serve' (without quotes)."
read -p "Press Enter to finish..."
