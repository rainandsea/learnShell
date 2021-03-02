#!/bin/bash
awk '{
    for(i=1;i<=NF;i++){voc[$i]++;}
} END{
    for(w in voc){print w" "voc[w];}
}' $1 | sort -k2,2 -n
