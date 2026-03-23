#!/bin/bash

archivo=$1

export FILENAME=

opcion=0

until [ $opcion == "6" ]
do
	echo "MENU"
	echo "1- Crear Entorno "
	echo "2- Correr Proceso "
	echo "3- Ver Alumnos por Padrón "
	echo "4- Ver 10 Notas más Altas "
	echo "5- Buscar Alumno por Padrón "
	echo "6- SALIR "

	echo  "Ingrese la opcion elegida: "
	read opcion

	case $opcion in
		1)
			mkdir ./Home
			mkdir ./Home/EPNro1
			mkdir ./Home/EPNro1/entrada
			mkdir ./Home/EPNro1/salida
			mkdir ./Home/EPNro1/procesado
			echo "Entorno creado"
			ls /*;;

		2) 
			
			cd Home/EPNro1/
			bash consolidar.sh &
			echo "Archivos procesados"
			;;
		3)
			cd Home/EPNro1/
			if [ -f ./salida/FILENAME.txt ];then
				sort -n ./salida/FILENAME.txt 
			
			fi;;
		4) 	cd Home/EPNro1/
                        if [ -f ./salida/FILENAME.txt ];then
                                sort -n -r -k5 ./salida/FILENAME.txt | head -n 10 

                        fi;;

		5)
			cd Home/EPNro1/
			if [ -f ./salida/FILENAME.txt ]; then
				echo "Ingrese N° de Padrón: "
				read padron
				grep $padron ./salida/FILENAME.txt
			else
				echo "El archivo no se encontró"
			fi;; 
		6)
			echo "Adios";;
		
	esac
done

