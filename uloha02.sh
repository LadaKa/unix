#!/bin/sh
fn() { for i in "$@"; do echo "$i"; done; }
fr() { for ((i=$#;i>=1;i--)) do echo "${!i}"; done; }
fs() { echo ${@//$2/$3}; }
fl() { s=''; for i in $@; do s=$s' '${#i}; done; echo $s;}


  --subst)
[Acase $1 in
  --normal)
    fn $@
    ;;
  --reverse)
    fr $@
    ;;
  --subst)
    fs $@
    ;;
  --len)
    fl $@
    ;;
  *)
    exit 0
    ;;
 esac
exit 0
