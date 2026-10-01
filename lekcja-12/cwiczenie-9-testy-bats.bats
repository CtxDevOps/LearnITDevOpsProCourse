#!/usr/bin/env bats
setup(){ load '../test.sh'; }

@test "poprawna nazwa" { run buduj_nazwe_archiwum system 20260927; [ "$status" -eq 0 ]; [ "$output" = system-20260927.tar.gz ]; }
@test "pusta nazwa" { run buduj_nazwe_archiwum '' 20260927; [ "$status" -eq 2 ]; }
@test "zero" { run waliduj_liczbe_nieujemna 0; [ "$status" -eq 0 ]; }
@test "liczba dodatnia" { run waliduj_liczbe_nieujemna 123; [ "$status" -eq 0 ]; }
@test "ujemna" { run waliduj_liczbe_nieujemna -1; [ "$status" -ne 0 ]; }
@test "tekst" { run waliduj_liczbe_nieujemna abc; [ "$status" -ne 0 ]; }
@test "zero bajtów" { run formatuj_rozmiar 0; [ "$output" = '0 B' ]; }
@test "KiB" { run formatuj_rozmiar 1024; [ "$output" = '1 KiB' ]; }
@test "MiB" { run formatuj_rozmiar 10240; [ "$output" = '10 MiB' ]; }
@test "tekstowy" { run formatuj_rozmiar abc; [ "$status" -eq 2 ]; }
