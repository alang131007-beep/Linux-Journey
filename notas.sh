#!/bin/bash
NOTA=5
if [ $NOTA -eq 10 ]; then
  echo "Excelente Promedio"
elif [ $NOTA -ge 6 -a $NOTA -le 7 ]; then
  echo "aprobaste"
elif [ $NOTA -ge 8 -a $NOTA -le 9 ]; then
  echo "felicidades aprobaste"
else
  echo "reprobaste"
fi
