awk -F ',' '$3 > 10000 && $3 < 100000 {print $0}' huina_bak.csv
