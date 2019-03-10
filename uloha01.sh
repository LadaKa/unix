#!/bin/sh
if [ "$1" == "--typ" ]; then
  [ ! -e "$2" ] && exit 1
  [ -L "$2" ] && echo "symbolicky link" && exit 0
  [ -d "$2" ] && echo "adresar" && exit 0
  echo "soubor"
elif [ "$1" == "--help" ]; then
  man
fi
