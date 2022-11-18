#!/usr/bin/env sh

if [[ -n $USER ]]; then
	PLISTS=($(find . -name "*.plist"))
	for PLIST in ${PLISTS[@]}
	do
		sed -i "" "s/minjakim/$USER/g" $PLIST
		if [[ -e /Users/$USER/Library/LaunchAgents/$PLIST ]]; then
			rm /Users/$USER/Library/LaunchAgents/$PLIST
		fi
		ln -s /Users/$USER/.ft_tools/$PLIST /Users/$USER/Library/LaunchAgents/.
	done
fi
