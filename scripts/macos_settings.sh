#!/bin/bash

# Configured MacOS settings to my personal preference
# NOTE: Most of these settings only take effect after a restart

echo "Configuring macOS settings..."

# Disable Key Accent Menu
defaults write -g ApplePressAndHoldEnabled -bool false

# Set scroll speed
defaults write -g com.apple.scrollwheel.scaling -float 20.0

# Set key repeat speed (after key repeat delay is hit)
defaults write -g KeyRepeat -float 1.0

# Restart necessary services to apply changes
killall cfprefsd

echo "Done configuring macOS settings."
