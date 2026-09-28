#!/bin/bash

# Przypisanie argumentu skryptu do zmiennej wejściowej
input_filepath="$1"

# 1. Katalog
directory_path="${input_filepath%/*}"

# 2. Nazwa pliku 
file_name="${input_filepath##*/}"

# 3. Nazwa bez rozszerzenia
file_name_no_ext="${file_name%.*}"

# 4. Usługa
service_name="${file_name_no_ext%%_*}"

# Zmienna pomocnicza do dalszego podziału (usuwa nazwę usługi z początku)
remainder_after_service="${file_name_no_ext#*_}"

# 5. Środowisko
environment_name="${remainder_after_service%%_*}"

# Zmienna pomocnicza przechowująca tylko ciąg daty
date_string="${remainder_after_service#*_}"

# 6. Rok
year="${date_string%%-*}"

# Zmienna pomocnicza przechowująca miesiąc i dzień
month_and_day="${date_string#*-}"

# 7. Miesiąc
month="${month_and_day%-*}"

# 8. Nazwa wielkimi literami
file_name_uppercase="${file_name^^}"

# Wypisanie wyników
echo "Katalog: ${directory_path}"
echo "Nazwa pliku: ${file_name}"
echo "Nazwa bez rozszerzenia: ${file_name_no_ext}"
echo "Usługa: ${service_name}"
echo "Środowisko: ${environment_name}"
echo "Rok: ${year}"
echo "Miesiąc: ${month}"
echo "Nazwa wielkimi literami: ${file_name_uppercase}"
