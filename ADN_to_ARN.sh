#!/usr/bin/env bash
set -e
set -u
set -o pipefail

read -p "Introduce el archivo: "  ADN

ADN_to_show=$(grep -v ">" "${ADN}") # ADN sin cabecera

lenght=$(echo "$ADN_to_show" | wc -L ) # Longitud total de la molécula introducida

echo "A continuación se muestra la secuencia de ADN y su correspondiente en ARN:"
echo $ADN_to_show
ARN=$(echo "$ADN_to_show" | tr T U) # Cambio de T a U para pasar la secuencia de ADN a ARN
echo $ARN 

ARN_to_count=$(echo "${ARN}" | fold -1) # ARN sin cabecera con 1 letra por linea

# Variables para conteo de bases
A_count=0
C_count=0
U_count=0
G_count=0
N_count=0

# Lectura base a base de la secuencia y conteo de cada base
for n in $ARN_to_count ;
	do 
		if [[ $n == "A" ]] ;
			then 
				A_count=$(($A_count + 1))
		elif [[ $n == "C" ]]
			then 
				C_count=$(($C_count + 1))
		elif [[ $n == "G" ]]
			then 
				G_count=$(($G_count + 1))
		elif [[ $n == "U" ]]
			then 
				U_count=$(($U_count + 1))
			else
				N_count=$(($N_count + 1))
		fi
	done

# Calculo del porcentaje que supone cada base
A_porcentage=`echo "scale=4; $A_count / $lenght * 100" | bc` #$(( $A_count * 100 / $lenght ))
C_porcentage=`echo "scale=4; $C_count / $lenght * 100" | bc` #$(($C_count * 100 / $lenght ))
G_porcentage=`echo "scale=4; $G_count / $lenght * 100" | bc` #$(($G_count * 100 / $lenght ))
U_porcentage=`echo "scale=4; $U_count / $lenght * 100" | bc` #$(($U_count * 100 / $lenght ))
N_porcentage=`echo "scale=4; $N_count / $lenght * 100" | bc` #$(($N_count * 100/ $lenght ))

# Resultados
echo ""
echo "La composición de bases de esta molécula de ARN es:"
echo ""
echo "Adenina: " $A_count"/"$lenght "("$A_porcentage"%)"
echo "Citosina: " $C_count"/"$lenght "("$C_porcentage"%)"
echo "Guanina: " $G_count"/"$lenght "("$G_porcentage"%)"
echo "Uracilo: " $U_count"/"$lenght "("$U_porcentage"%)"
echo "Ns: " $N_count"/"$lenght "("$N_porcentage"%)"



 


			


