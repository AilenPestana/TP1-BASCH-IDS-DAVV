#!/bin/bash


entrada=./entrada #Guardamos las carpetas en variables 
salida=./salida/FILENAME.txt #Guardamos en salida el txt para luego usarlo de ubicación de destino
procesado=./procesado

for archivo in $entrada/*.txt #archivo es nuestra variable iteradora, recorremos todos los archivos de tipo txt
	do
		if [ -f "$archivo" ]; then  #si el archivo existe...
			cat "$archivo">>"$salida" #lo leemos y copiamos en salida (recordando q es el FILENAME.txt)
			mv "$archivo" "$procesado" #movemos el archivo a la carpeta procesado


		fi
	done
  
