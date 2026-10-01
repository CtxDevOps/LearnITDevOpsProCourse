#!/usr/bin/env bash
 
buduj_nazwe_archiwum() {
    local n=${1-}
    local d=${2-}
 
    [[ -n "$n" ]] || return 2
    [[ "$d" =~ ^[0-9]{8}$ ]] || return 2
 
    printf '%s-%s.tar.gz\n' "$n" "$d"
}
 
waliduj_liczbe_nieujemna() {
    [[ ${1-} =~ ^[0-9]+$ ]]
}
 
formatuj_rozmiar() {
    local b=${1-}
 
    waliduj_liczbe "$b" || return 2
 
    if (( b < 1024 )); then
        printf '%d B\n' "$b"
    elif (( b < 1048576 )); then
        printf '%d KiB\n' "$(( b / 1024 ))"
    elif (( b < 1073741824 )); then
        printf '%d MiB\n' "$(( b / 1048576 ))"
    else
        printf '%d GiB\n' "$(( b / 1073741824 ))"
    fi
}
 
main() {
    printf 'Biblioteka funkcji.\n'
}
 
[[ "${BASH_SOURCE[0]}" == "$0" ]] && main "$@"
