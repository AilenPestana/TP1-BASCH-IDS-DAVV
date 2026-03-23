#!/bin/bash

archivo=$1

opcion=0

until  [ $opcion == "6" ]
do
	echo "MENU"
	echo "1- Crear Entorno "
	echo "2- Correr Proceso "
	echo "3- Ver Alumnos por Padrón "
	echo "4- Ver 10 Notas más Altas "
	echo "3- Buscar Alumno por Padrón "
	echo "6- SALIR "

	echo  "Ingrese la opcion elegida: "
	read opcion

	case $opcion in
		1)
			mkdir ./Home/EPNro1
			mkdir ./EPNro1/entrada
			mkdir ./EPNro1/salida
			mkdir ./EPNro1/procesado
			echo "Entorno creado"
			ls /*;;

		2) 
			nano "$archivo";;
		3)
			if [ -f ./salida/FILENAME.txt ];then
				sorted -n FILENAME.txt #tomar el archivo, convertirlo en tuplas, ordenar las tuplas por su elemento 0 y volver a convertir en archivo.
			fi;;
		4) #parecido al  3;;
		5)	
			if [ -f ./salida/FILENAME.txt ]; then
				echo "Ingrese N° de PAdrón: "
				read padron
				grep $padron ./FILENAME.txt
			else
				echo "El archivo no se encontró"
			fi;; 
	esac
done

