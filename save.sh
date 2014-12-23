#!/usr/bin/env bash
cd ~

function doIt() {
    for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,vimrc,bashrc,inputrc,screenrc,gitconfig,curlrc,wgetrc,osx}; do
        cp "$file" ${DOTFILES}
    done;
    for file in ~/{brew.sh,save.sh}; do
        cp "$file" ${DOTFILES}
    done;
    green='\033[1;32m'
    NC='\033[0m'
    echo -e "${green}Files copied successfully!${NC}";
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
