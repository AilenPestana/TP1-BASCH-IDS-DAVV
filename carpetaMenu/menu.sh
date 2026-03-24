#!/bin/bash

archivo=$1 #Guarda lo que escribimos al ejecutar el script

export FILENAME="alumnos" #Variable de entorno utilizada para el FILENAME.txt

opcion=0 #Variable que nos permite guardar la opcion elegida en el menu
parametro=$1 #Almacena el valor  ultilizado para el parametro optativo -d

if [ "$parametro" = "-d" ];then #Si el usuario ejecuta el script con parametro -d, borramos el entorno, lo que mata el proceso en  2do plano 
	cd ./Home/ 
        rm -r ./EPNro1
else #si el usuario  ejecuta normal, se muestra el menu
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
			1) #si elegi opc 1 se crea el entrono Home y el directorio EPNro1 q contiene 3 carpetas y un script en background 
				mkdir ./Home
				mkdir ./Home/EPNro1
				mkdir ./Home/EPNro1/entrada
				mkdir ./Home/EPNro1/salida
				mkdir ./Home/EPNro1/procesado
				
				
				touch ./Home/EPNro1/consolidar.sh #creamos el script de background 
				echo '#!/bin/bash' > ./Home/EPNro1/consolidar.sh #con cada echo asignamos una linea de instrucciones
				echo '' >> ./Home/EPNro1/consolidar.sh
				echo 'entrada=./entrada' >> ./Home/EPNro1/consolidar.sh #usamos variables para referirnos a las carpetas
				echo 'salida=./salida/FILENAME.txt' >> ./Home/EPNro1/consolidar.sh
				echo 'procesado=./procesado' >> ./Home/EPNro1/consolidar.sh
				echo 'for archivo in $entrada/*.txt' >> ./Home/EPNro1/consolidar.sh #por cada archivo q haya en entrada, se transcribe la informacion en salida y se mueve el mismo a procesado
				echo 'do' >> ./Home/EPNro1/consolidar.sh
				echo 'if [ -f "$archivo" ];then' >> ./Home/EPNro1/consolidar.sh
				echo 'cat "$archivo">>"$salida"' >> ./Home/EPNro1/consolidar.sh
				echo 'mv "$archivo" "$procesado"' >> ./Home/EPNro1/consolidar.sh
				echo 'fi'>> ./Home/EPNro1/consolidar.sh
				echo 'done' >> ./Home/EPNro1/consolidar.sh

				chmod +x ./Home/EPNro1/consolidar.sh #Da permiso de ejecucion a consolidar.sh

				echo "Entorno creado"
				;;

			2) 
				if [ -d ./Home ];then #corroboramos que exista Home

					cd Home/EPNro1/ #nos posicionamos para evitar errores de ruta
					bash consolidar.sh & #ejecutamos el script en segundo plano
					echo "Archivos procesados"

				else
					echo "Se necesita crear el Entorno" #si no existe Home
				fi;;
			3)
				cd Home/EPNro1/
				if [ -f ./salida/FILENAME.txt ];then #si existe el archivo filename en salida, lo ordena numericamente
					sort -n ./salida/FILENAME.txt
				else
					echo "No se encontró el archivo" 
				fi;;
			4) 	cd ./Home/EPNro1/
                	        if [ -f ./salida/FILENAME.txt ];then
                        	        sort -n -r -k5 ./salida/FILENAME.txt | head -n 10 #ordena numricamente segun la clumna 5 del archivo y solo muestra el top 10 de mayor a menor
				else
                        	        echo "No se encontró el archivo" 

                       		fi;;

			5)
				cd ./Home/EPNro1/
				if [ -f ./salida/FILENAME.txt ]; then
					echo "Ingrese N° de Padrón: " #busca dentro del archivo un numero especifico y muestra toda la linea
					read padron
					grep $padron ./salida/FILENAME.txt
				else
					echo "El archivo no se encontró"
				fi;; 
			6)
				echo "Adios";;

		esac
	done
fi
