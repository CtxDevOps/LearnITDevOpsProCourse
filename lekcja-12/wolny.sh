#!/usr/bin/env bash

set -euo pipefail

#Definicja sciezek do plikow

LOG_FILE="/home/adminpi/Documents/LearnITDevOpsProCourse/lekcja-12/wolny.log"
LOCK_FILE="/home/adminpi/Documents/LearnITDevOpsProCourse/lekcja-12/wolny.lock"

#otwiera plik i przypisuje mu staly numer
exec 200>"${LOCK_FILE}"

#zalozenie blokady na zasob typu 200 + || (or) - wymusza zakonczenie z kodem 4 (prewencja dublowania operacji)
flock -w 5 200 || exit 4


echo "$(date) - start skryptu >> "${LOG_FILE}"
sleep 15
echo "$(date) - koniec skryptu >> "${LOG_FILE}"
