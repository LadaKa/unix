#!/bin/sh
len1=`wc -l "$1" | cut -d' ' -f1`
len1=$((len1-1))
cut -d';' -f4 "$1" | tail -n "$len1"|sort > tmp1
len2=`wc -l "$2" | cut -d' ' -f1`
len2=$((len2-1))
tail -n "$len2"|sort > tmp2
join tmp0 tmp1 -t';'| cut -d';' -f1
rm tmp1
rm tmp2
