#!/bin/sh
keys="";
for str in "$@";do
        for i in $(seq -s' ' 0 ${#str});do
                ch=${str:i:1};
                freq_[$ch]=`expr ${freq_[$ch]} + 1`;
                if [ ${freq_[$ch]} -eq 1 ]; then
                        keys="$keys $ch";
                fi;
        done;
done;
for f in $keys; do
        echo "${freq_[$f]}:$f";
done;
