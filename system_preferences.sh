#!/usr/bin/env sh

if [[ -n $USER ]]; then

	# https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

	osascript -e 'tell application "System Preferences" to quit'
	
	for SETTING in "InitialKeyRepeat -int 15" \
		"KeyRepeat -int 2" \
		"ApplePressAndHoldEnabled -bool false" \
		"NSAutomaticCapitalizationEnabled -bool false" \
		"NSAutomaticDashSubstitutionEnabled -bool false" \
		"NSAutomaticPeriodSubstitutionEnabled -bool false" \
		"NSAutomaticQuoteSubstitutionEnabled -bool false" \
		"NSAutomaticSpellingCorrectionEnabled -bool false" \
		"com.apple.mouse.scaling -int 2" \
		"com.apple.scrollwheel.scaling -int 5" \
		"com.apple.mouse.doubleClickThreshold -float 1" \
		"com.apple.swipescrolldirection -bool false" \
		"_HIHideMenuBar -bool false"
	do
		defaults write NSGlobalDomain $SETTING
	done

	defaults write com.apple.finder CreateDesktop -bool false

	for APP in "cfprefsd" \
		"Finder"
	do
		killall "$APP" &> /dev/null
	done
fi


