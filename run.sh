#!/bin/sh
# auto pull the configure file

BASE_URL=https://raw.githubusercontent.com/alekye/AYConfiguration/master
DISABLE_CACHE="?v=$(date +%s)"

function echo_green() {
	echo "\033[32m$1\033[0m"
}

# .vimrc
VIMRC_FILE=${BASE_URL}/vimrc${DISABLE_CACHE}
echo "Download .vimrc to ~/.vimrc from ${VIMRC_FILE}"
curl -o ~/.vimrc ${VIMRC_FILE}
echo "Download .vimrc 【OK】"
