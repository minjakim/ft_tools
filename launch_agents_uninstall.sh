#!/usr/bin/env sh

if [[ -n $USER ]]; then
	PLISTS=($(find . -name "*.plist"))
	for PLIST in ${PLISTS[@]}
	do
		if [[ -e /Users/$USER/Library/LaunchAgents/$PLIST ]]; then
			rm /Users/$USER/Library/LaunchAgents/$PLIST
		fi
	done
fi
