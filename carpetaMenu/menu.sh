#!/bin/bash

archivo=$1

export FILENAME="alumnos"

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
	echo "d- Borrar entorno y procesos"

	echo  "Ingrese la opcion elegida: "
	read opcion

		case $opcion in
			1)
				mkdir ./Home
				mkdir ./Home/EPNro1
				mkdir ./Home/EPNro1/entrada
				mkdir ./Home/EPNro1/salida
				mkdir ./Home/EPNro1/procesado
				
				
				touch ./Home/EPNro1/consolidar.sh				
				echo '#!/bin/bash' > ./Home/EPNro1/consolidar.sh
				echo '' >> ./Home/EPNro1/consolidar.sh
				echo 'entrada=./entrada' >> ./Home/EPNro1/consolidar.sh
				echo 'salida=./salida/FILENAME.txt' >> ./Home/EPNro1/consolidar.sh
				echo 'procesado=./procesado' >> ./Home/EPNro1/consolidar.sh
				echo 'for archivo in $entrada/*.txt' >> ./Home/EPNro1/consolidar.sh
				echo 'do' >> ./Home/EPNro1/consolidar.sh
				echo 'if [ -f "$archivo" ];then' >> ./Home/EPNro1/consolidar.sh
				echo 'cat "$archivo">>"$salida"' >> ./Home/EPNro1/consolidar.sh
				echo 'mv "$archivo" "$procesado"' >> ./Home/EPNro1/consolidar.sh
				echo 'fi'>> ./Home/EPNro1/consolidar.sh
				echo 'done' >> ./Home/EPNro1/consolidar.sh

				chmod +x ./Home/EPNro1/consolidar.sh

				echo "Entorno creado"
				ls /*;;

			2) 
				if [ -d ./Home ];then

					cd Home/EPNro1/
					bash consolidar.sh &
					echo "Archivos procesados"

				else
					echo "Se necesita crear el Entorno"
				fi;;
			3)
				cd Home/EPNro1/
				if [ -f ./salida/FILENAME.txt ];then
					sort -n ./salida/FILENAME.txt
				else
					echo "No se encontró el archivo" 
				fi;;
			4) 	cd ./Home/EPNro1/
                	        if [ -f ./salida/FILENAME.txt ];then
                        	        sort -n -r -k5 ./salida/FILENAME.txt | head -n 10
				else
                        	        echo "No se encontró el archivo" 

                       		fi;;

			5)
				cd ./Home/EPNro1/
				if [ -f ./salida/FILENAME.txt ]; then
					echo "Ingrese N° de Padrón: "
					read padron
					grep $padron ./salida/FILENAME.txt
				else
					echo "El archivo no se encontró"
				fi;; 
			6)
				echo "Adios";;
			d)	
				cd ./Home/
        	        	rm -r ./EPNro1
	        	        
				;;
		esac
done
