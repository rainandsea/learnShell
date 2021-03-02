#!/bin/bash

for i in $(awk "{print}" nowcoder.txt); do
    if [[ ${#i} -lt 8 ]]; then
        echo $i
    fi
done
