#!/usr/bin/env bash
cd ~

function doIt() {
    for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
        cp "$file" ${DOTFILES}
    done;
    echo "Files copied successfully!";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
