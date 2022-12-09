#!/usr/bin/env sh

if [[ -n $USER ]]; then

	# ex. /Users/minjakim/Library/Caches -> "/Library/Caches"
	#
	# below is a list of what I use. (slightly extreme)
	#
	# "/Library/Caches" \
	# "/Library/Containers" \
	# "/.brew/Library/Taps/homebrew/homebrew-core/.git" \
	# "/.vscode" \
	# "/.npm" \
	# "/.cache" \
	# "/Library/ApplicationSupport/discord" \
	# "/Library/ApplicationSupport/Google" \
	# "/Library/ApplicationSupport/BraveSoftware" \
	# "/Library/ApplicationSupport/Code" \
	# "/Library/ApplicationSupport/Slack"

	for FOLDER in "/Library/Caches" \
		"/Library/Containers" \
		"/.cache"
	do
		if [[ ! -d "/goinfre/$USER$FOLDER" ]]; then
			mkdir -p "/goinfre/$USER$FOLDER"
		fi
		while [[ -d "/Users/$USER$FOLDER" ]]
		do
			rm -rf "/Users/$USER$FOLDER"
		done
		ln -Fs "/goinfre/$USER$FOLDER" "/Users/$USER$FOLDER"
	done
fi

