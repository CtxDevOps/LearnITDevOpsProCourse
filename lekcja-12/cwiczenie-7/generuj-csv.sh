#!/bin/bash
awk 'BEGIN {
    srand();
    split("Europa Azja Afryka Ameryka-Pld", regiony);
    for(i=1; i<=50000; i++) {
        region = regiony[int(rand()*4)+1];
        kwota = int(rand()*1000)+1;
        printf "2026-10-01,%s,%d\n", region, kwota;
    }
}' > sprzedaz.csv
echo "Wygenerowano sprzedaz.csv z 50 000 wierszy."
