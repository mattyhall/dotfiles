#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
		-avh --no-perms . ~;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
fi;
unset doIt;

