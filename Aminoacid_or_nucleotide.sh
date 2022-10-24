#!/usr/bin/env bash
set -e
set -u
set -o pipefail

mas="si" # variable de control para repetir el script o no al llegar al final
while [[ $mas == "si" ]]
	do
		read -p "Introduce el archivo: "  file

		file=$(grep -v ">" "${file}" | fold -1 ) # Quitar la cabecera y leer la secuencia letra a letra
		 
		a=0 # variable de control. a=0 marcará secuencia nucleotídica y a=1 marcará secuencia aminoacídica

		for n in $file ;
			do
				if [[ $n != "A" && $n != "G" && $n != "C" && $n != "T" && $n != "U" && $n != "N" ]] ; 
				# Condiciones para que sea una secuencia aminoacídica (U en caso de ser ARN y N en caso de que haya nucleotidos desconocidos)
					then
						# Es una secuencia aminoacidica
						a=1 # cambio en la variable de control
						break
				fi
			done

		if [[ $a != 0 ]] ;
			then
				echo "El archivo introducido es una secuencia aminoacídica" 
				# a=1 al pasar los criterios de if en el for loop anterior
			else
				echo "El archivo introducido es una secuencia nucleotídica" 
				# a=0 al no pasar los criterios
		fi
		
		read -p "¿Algún otro archivo? (responder si o no) " mas 
		# Pregunta para volver a repetir el script e introducir otro archivo o salir.
			
	done
	

 
	
