#!/bin/bash

MINECRAFTPROFILE="default"

if [[ "$1" == "-p" ]]; then
  if [[ "$2" == "" ]]; then
    echo "$0: Profile argument needs a value." >&2
    exit 66;
  fi
  MINECRAFTPROFILE="$2"
  shift
  shift
fi

if [ ! -d "$HOME/.mc-plugins" ]; then
  mkdir "$HOME/.mc-plugins"
fi
PLUGINDIR="$HOME/.mc-plugins/plugins"

if [ ! -d "$HOME/.mc-plugins/profiles.d" ]; then
  mkdir "$HOME/.mc-plugins/profiles.d"
fi

while [ ! -f "$HOME/.mc-plugins/profiles.d/$MINECRAFTPROFILE" ]; then
  printf "Enter Minecraft path for '$MINECRAFTPROFILE'.\n(Leave blank to abort)\n"
  read -p "Path: " -e mcpath
  if [[ "$mcpath" == "" ]]; then
    echo "$0: no new path given. Aborting..."
    exit 67
  fi
  mcpath="${mcpath%spigot.jar}"
  mcpath="${mcpath%/}"
  if [ -f "$mcpath/spigot.jar" ]; then
    printf "{\n\"plugindir\":\"$plugindir\",\n\"minecraftdir\":\"$mcpath\"\n}" > "$HOME/.mc-plugins/profiles.d/$MINECRAFTPROFILE"
  else
    echo "$0: could not find 'spigot.jar' at '$mcpath'" >&2
  fi
fi

MINECRAFTDIR="$(grep "^\"minecraftdir\":" "$HOME/.mc-plugins/profiles.d/$MINECRAFTPROFILE" | sed 's/.*": *//' | sed 's/^ *"\(.*\)" *,? *$/\1/')"
if [[ "$MINECRAFTDIR" == "" ]]; then
  echo "$0: could not find minecraftdir for profile '/$MINECRAFTPROFILE'" >&2
fi


COMMAND="$1"
shift

cmd="$HOME/.mc-plugins/scripts/commands.d/$COMMAND"
if [ -f "$cmd" ]; then
  . "$cmd"
else
  echo "$0: unknown command '$COMMAND'." >&2
fi
