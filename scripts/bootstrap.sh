#!/bin/bash

WDIR="$(pwd)"

gitpath="https://github.com/TimLuq/mc-plugin.git"
zippath="https://github.com/TimLuq/mc-plugin/archive/master.zip"
MCPLUGINROOT="$HOME/.mc-plugin"

if [ ! -d "$MCPLUGINROOT" ]; then
  mkdir "$MCPLUGINROOT"
fi
needupdate=1
if [ -f "$MCPLUGINROOT/updated" ]; then
  if [ $(( $(date "+%s") - 86400 )) -lt "$(cat "$MCPLUGINROOT/updated")" ]; then
    needupdate=""
  fi
fi

if [[ "$1" == "--update" ]] || [[ "$needupdate" != "" ]]; then
  shift
  updatepath=""
  if which git >/dev/null; then
    updatepath="$MCPLUGINROOT/git/mc-plugin"
    if [ -d "$updatepath" ]; then
      cd "$updatepath"
      git checkout
    else
      if [ ! -d "$MCPLUGINROOT/git" ]; then
        mkdir "$MCPLUGINROOT/git"
      fi
      cd "$MCPLUGINROOT/git"
      git clone "$gitpath" --branch "master" --single-branch "$updatepath"
    fi
  else
    updatepath="$MCPLUGINROOT/zip/mc-plugin-master"
    if [ ! -d "$MCPLUGINROOT/zip" ]; then
      mkdir "$MCPLUGINROOT/zip"
    fi
    cd "$MCPLUGINROOT/zip"
    wget "$zippath" && unzip "mc-plugin-master.zip"
  fi
  rsync -av "$updatepath/scripts" "$MCPLUGINROOT"
  rsync -av "$updatepath/repositories.d" "$MCPLUGINROOT"
  date "+%s" > "$MCPLUGINROOT/updated"
fi

cd "$MCPLUGINROOT"
. "$MCPLUGINROOT/scripts/main.sh"
