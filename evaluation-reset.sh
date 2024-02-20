#!/bin/bash

products=(IntelliJIdea WebStorm DataGrip PhpStorm CLion PyCharm GoLand RubyMine)

for product in ${products[@]}
do
  echo "Resetting trial for $product"

  echo "removing key..."
  rm -rf ~/.config/$product*/eval

  # Fix for latest version
  rm -rf ~/.config/JetBrains/$product*/eval

  echo "removing all evlsprt properties in options.xml..."
  sed -i 's/evlsprt//' ~/.config/$product*/options/other.xml

  # Fix for latest version
  sed -i 's/evlsprt//' ~/.config/JetBrains/$product*/options/other.xml
done

echo "removing userPrefs files..."
rm -rf ~/.java/.userPrefs

echo "DONE"