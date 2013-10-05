#!/bin/bash

# Program for lazy people to test the pascal code
# USAGE:
# $ ./testpascal.sh <N-Randoms> <Binary>

# example: 
# $ ./testpascal.sh 5 folgeninverter.exe
#
# Geben Sie  5 Werte ein:
# Bitte 1. Zahl eingeben: Bitte 2. Zahl eingeben: Bitte 3. Zahl eingeben: Bitte 4. Zahl eingeben: Bitte 5. Zahl eingeben: Die groesste Zahl ist 23207.

# INPUT GIVEN:
# 21305
# 23207
# 13275
# 8209
# 21735
#

NZAHL=$1

strg=""
for i in $(seq 1 $NZAHL); do
    strg="$strg"$RANDOM"\n" 
done

echo -e $strg | build/$2
echo 
echo 'INPUT GIVEN:'
echo -e $strg
