#!/bin/sh
#
# kontrolovac/ukoly/test.sh [SKRIPT]
#       Spusteni skriptu pro porovnani vysledku v kontrolovac/ukoly/runtest.sh
#       se vstupem ze souboru
#               "kontrolovac/ukoly/[UKOL_N/JMENO_UKOLU].in".
#       SKRIPT odpovida souboru
#               "kontrolovac/studenti/gity/[NAME]/[UKOL_N/JMENO_UKOLU].sh",
exec "$1"
