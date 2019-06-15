#!/bin/sh

sed  '
 
 /[0-9]\+ *+ *[0-9]\+/ {
         
         s/\([0-9]\+\)\( *+ *\)\([0-9]\+\)/,\1 \3/
         :dvojice
         s/\([0-9]*\)\(,\)\([0-9]*\)\([0-9]\)\( [0-9]*\)\([0-9]\)$/\1\4\6\2\3\5/
         t dvojice
         :nuly
         s/\(.*\)\(, *[0-9]*\)\([0-9]\)/\10\3\2/
         t nuly
         s/,//
         s/ //
         s/\([0-9]\{2\}\)\(.*\)/,0\1:\2/
         :scitani
         /,[0-9]\+|*/ {
                s/\(0\)\(|*:\)/\2/;
                s/\(1\)\(|*:\)/|\2/;
                s/\(2\)\(|*:\)/||\2/;
                s/\(3\)\(|*:\)/|||\2/;
                s/\(4\)\(|*:\)/||||\2/;
                s/\(5\)\(|*:\)/|||||\2/;
                s/\(6\)\(|*:\)/||||||\2/;
                s/\(7\)\(|*:\)/|||||||\2/;
                s/\(8\)\(|*:\)/||||||||\2/;
                s/\(9\)\(|*:\)/|||||||||\2/;
         }
         t scitani
         /||||||||||:/ !{
                 s/\(|*\):/\10:/
         }
         /||||||||||:/ {
                 s/||||||||||:/1:/
         }
         s/,0:/,00:/;
         s/,1:/,01:/;
         s/|||||||||/9/;
         s/||||||||/8/;
         s/|||||||/7/;
         s/||||||/6/;
         s/|||||/5/;
         s/||||/4/;
         s/|||/3/;
         s/||/2/; 
         s/|/1/;
 }
'
