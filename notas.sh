#!/bin/bash
NOTA=6
if [ $NOTA -eq 10 ]; then
  echo "Aprobaste con excelencia"
elif [ $NOTA -ge 7 ]; then
  echo "Aprobaste"
else
  echo "Estas reprobado"
fi
