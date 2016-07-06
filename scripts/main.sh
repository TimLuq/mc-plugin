#!/bin/bash

MINECRAFTPROFILE="default"
if [[ "$MAKE" == "" ]]; then
  MAKE="make"
fi

if [[ "$1" == "-p" ]]; then
  if [[ "$2" == "" ]]; then
    echo "$0: Profile argument needs a value." >&2
    exit 66;
  fi
  MINECRAFTPROFILE="$2"
  shift
  shift
fi

if [ ! -d "$MCPLUGINROOT" ]; then
  mkdir "$MCPLUGINROOT"
fi
PLUGINDIR="$HOME/.mc-plugin/plugins"

if [ ! -d "$MCPLUGINROOT/profiles.d" ]; then
  mkdir "$MCPLUGINROOT/profiles.d"
fi

while [ ! -f "$MCPLUGINROOT/profiles.d/$MINECRAFTPROFILE" ]; do
  printf "Enter Minecraft path for '$MINECRAFTPROFILE'.\n(Leave blank to abort)\n"
  read -p "Path: " -e mcpath
  if [[ "$mcpath" == "" ]]; then
    echo "$0: no new path given. Aborting..."
    exit 67
  fi
  mcpath="${mcpath%spigot.jar}"
  mcpath="${mcpath%/}"
  if [ -f "$mcpath/spigot.jar" ]; then
    printf "{\n\"plugindir\":\"$PLUGINDIR\",\n\"minecraftdir\":\"$mcpath\"\n}" \
      > "$MCPLUGINROOT/profiles.d/$MINECRAFTPROFILE"
  else
    echo "$0: could not find 'spigot.jar' at '$mcpath'" >&2
  fi
done

MINECRAFTDIR="$(grep "^\"minecraftdir\":" "$MCPLUGINROOT/profiles.d/$MINECRAFTPROFILE" \
  | sed 's/.*": *//' | sed 's/^ *"\(.*\)" *,? *$/\1/')"
if [[ "$MINECRAFTDIR" == "" ]]; then
  echo "$0: could not find minecraftdir for profile '/$MINECRAFTPROFILE'" >&2
fi

if ! which "$MAKE" &> /dev/null; then
  if [ ! -x "$MCPLUGINROOT/scripts/fake-make" ]; then
    if ! wget -O "$MCPLUGINROOT/scripts/fake-make" "https://raw.githubusercontent.com/TimLuq/fake-make/master/fake-make"; then
      echo "$0: no make-tool" >&2
      exit 14
    fi
    chmod 755 "$MCPLUGINROOT/scripts/fake-make"
  fi
  MAKE="$MCPLUGINROOT/scripts/fake-make"
fi

COMMAND="$1"
shift

cmd="$MCPLUGINROOT/scripts/commands.d/$COMMAND"
if [ -f "$cmd" ]; then
  . "$cmd"
else
  echo "$0: unknown command '$COMMAND'." >&2
fi
