#!/usr/bin/env sh

if [[ -n $USER ]]; then


	for FOLDER in "/Library/Caches" \
		"/Library/Containers" \
		"/.brew/Library/Taps/homebrew/homebrew-core/.git" \
		"/.vscode" \
		"/.npm" \
		"/.cache" \
		"/Library/ApplicationSupport/discord" \
		"/Library/ApplicationSupport/Google" \
		"/Library/ApplicationSupport/BraveSoftware" \
		"/Library/ApplicationSupport/Code" \
		"/Library/ApplicationSupport/Slack"
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

