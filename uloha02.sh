#!/bin/sh
fn() { for i in "$@"; do echo "$i"; done; }
fr() { for ((i="$#";i>=1;i--)) do echo "${!i}"; done; }
fs() { a=$2; b=$3; shift 3; echo "${@//$a/$b}"; }
fl() { s=''; for i in $@; do s=$s' '${#i}; done; echo $s;}
case "$1" in
  --normal)
    fn "$@"
    ;;
  --reverse)
    fr "$@"
    ;;
  --subst)
    fs "$@"
    ;;
  --len)
    fl "$@"
    ;;
  --help)
    text="
Pouzitie: uloha02.sh [OPTION] [args]
  --normal   vypíše všetky argumenty (vrátane --normal), každý arugment na jeden riadok
  --reverse  vypíše argumenty v opačnom poradí, ako sú na vstupe, každý na jeden riadok
  --subst    nahradi vsechny vyskyty druheho argumentu prvnim argumentem
  --len      vypíše na jeden riadok dĺžky všetkých argumentov, oddelený medzerami
  --help     vypíše návod na použitie
"
  echo $text ;;
  *)
    exit 0
    ;;
 esac
exit 0
