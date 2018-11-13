#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude "mdracular.dconf" \
		--exclude "bootstrap.sh" \
		-avh --no-perms . ~;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    dconf load /org/gnome/terminal/legacy/profiles:/:2fbe1c5f-b5c3-4a50-a929-2bcfcf97fd12/ < mdracular.dconf
    doIt;
fi;
unset doIt;
