#!/bin/bash

total=0
for i in $(awk '{print $6}' nowcoder.txt); do
    total=$(expr $total + $i)
done
echo $total

# cat nowcoder.txt | awk '{sum+=$6}END{print sum}'
