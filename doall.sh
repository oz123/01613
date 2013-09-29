#!/bin/bash
for i in `make -rpn | sed -n -e '/^$/ { n ; /^[^ ]*:/p }' | sed -e 's/://' | egrep -v -E '(all|clean)'`; 
    do make $i; 
done
