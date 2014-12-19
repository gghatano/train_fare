#!/bin/bash

cat 23.html | 
sed 's/\.html">/.html">'"$LF"'/g' | 
grep 駅| 
awk -F"<" '{print $1}' | 
grep -v -e "^\s*$" | xargs echo
