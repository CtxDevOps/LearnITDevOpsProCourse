#!/bin/bash

# Definicja funkcji pomocniczych
show_disk() {
    echo "=== Dysk ==="
    df -h
    echo ""
}

show_memory() {
    echo "=== Pamięć ==="
    free -m
    echo ""
}

show_uptime() {
    echo "=== Uptime ==="
    uptime
    echo ""
}

show_network() {
    echo "=== Sieć (Adresy IP) ==="
    ip -brief address show
    echo ""
}

show_help() {
    echo "Użycie: $0 <polecenie>"
    echo "Dostępne polecenia:"
    echo "  dysk     - wyświetla użycie przestrzeni dyskowej"
    echo "  pamiec   - wyświetla użycie pamięci RAM"
    echo "  uptime   - wyświetla czas działania systemu"
    echo "  siec     - wyświetla adresy IP interfejsów sieciowych"
    echo "  wszystko - wyświetla wszystkie powyższe informacje"
    echo "  -h, --help - wyświetla ten komunikat pomocy"
}

# Pobranie pierwszego argumentu skryptu
command_arg="$1"

# Instrukcja case sterująca na podstawie podanego argumentu
case "${command_arg}" in
    dysk)
        show_disk
        ;;
    pamiec)
        show_memory
        ;;
    uptime)
        show_uptime
        ;;
    siec)
        show_network
        ;;
    wszystko)
        # Wywołanie wszystkich funkcji jedna po drugiej
        show_disk
        show_memory
        show_uptime
        show_network
        ;;
    -h|--help)
        show_help
        exit 0
        ;;
    *)
        # Obsługa polecenia kosmos (np. "kosmos")
        echo "Błąd: Nieznane polecenie '${command_arg}'." >&2
        show_help
        # Zakończenie działania z kodem 2
        exit 2
        ;;
esac
