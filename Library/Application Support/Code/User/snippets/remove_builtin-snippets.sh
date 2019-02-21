#!/usr/bin/env bash

set -e
set -x

find '/Applications/Visual Studio Code.app/Contents/Resources/app/extensions' -path '*snippets*.json' -exec sh -c "echo 'Writing {}'; echo \{\} > '{}'" \;
find $HOME/.vscode/extensions -path '*snippets*.json' -exec sh -c "echo 'Writing {}'; echo \{\} > '{}'" \;
