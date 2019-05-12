#!/bin/sh
sort "$1" > tmp1;
sort "$2" > tmp2;
sort "$3" > tmp3;
join tmp1 tmp2  -t':' > tmp12
join tmp12 tmp3  -t':'
rm tmp1
rm tmp2
rm tmp3
