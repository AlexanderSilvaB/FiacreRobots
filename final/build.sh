#!/bin/bash

echo "Fiacre Builder"
echo "Project name: $1"

project=$1

FIACREPATH=/opt/frac-2.5.0

rm -rf ${project}.tts
rm ${project}.ktz
frac ${project}.fcr ${project}.tts
make -f ${FIACREPATH}/Makefile ${project}
tina ${project}.tts ${project}.ktz
tina -d ${project}.tts > info.txt
selt ${project}.ktz ${project}.ltl -q -b -S ${project}.scn