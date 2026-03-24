#!/bin/bash

entrada=./entrada
salida=./salida/FILENAME.txt
procesado=./procesado
for archivo in $entrada/*.txt
do
if [ -f "$archivo" ];then
cat "$archivo">>"$salida"
mv "$archivo" "$procesado"
fi
done
