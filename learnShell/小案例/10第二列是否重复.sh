awk '{print $2}' nowcoder.txt | sort | uniq -cd | sort -n
