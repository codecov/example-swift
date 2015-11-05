#!/bin/bash

echo "Add execute privs to key scripts..."
chmod +x scripts/travis/add-key.sh
chmod +x scripts/travis/remove-key.sh

echo "Adding build keys to keychain"
./scripts/travis/add-key.sh

echo "installing carthage"
brew install carthage

echo "install carthage packages"
carthage update --platform iOS

#echo "removing keys"
#./scripts/travis/remove-key.sh
