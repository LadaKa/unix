#!/bin/sh
if [ "$1" == "--typ" ]; then
  [ ! -e "$2" ] && echo "Chyba" && exit 1
  [ -L "$2" ] && echo "symbolicky link" && exit 0
  [ -d "$2" ] && echo "adresar" && exit 0
  [ -b "$2" ] && echo "blokove zariadenie" && exit 0
  [ -c "$2" ] && echo "znakove zariadenie" && exit 0
  [ -S "$2" ] && echo "soket" && exit 0
  [ -p "$2" ] && echo "fifo" && exit 0
  echo "subor"
elif [ "$1" == "--help" ]; then
echo '
Pouziti: uloha01.sh [--typ|--help] [cesta_k_souboru]
  --typ  Vytiskne typ zadaneho souboru.
  --help Vytiskne navod.

Exit status:
  0  OK.
  1  Neplatny vstup.
'
else 
  echo "Chyba" 
  exit 1
fi
