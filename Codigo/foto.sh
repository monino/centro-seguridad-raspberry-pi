#!/bin/bash
#-*-ENCODING:UTF-8-*-

#recibe el numero de fotos a hacer

#variables
ruta="/home/pi/fotos"
ancho=1920
alto=1080
let fotos_cada=5000 #es 5 seg
let num_fotos=$1
let fotos_durante=1*$num_fotos*$fotos_cada

#echo "Como son $1 fotos haría fotos durante $fotos_durante tiempo, 1 cada 5 seg"

comando_foto="raspistill -w $ancho -h $alto -q 75 " #inicial para 1 o varias fotos

if [ $num_fotos -gt 1 ];
then
	let fotos_durante=$fotos_durante-5000
	comando_foto="$comando_foto -t $fotos_durante -tl $fotos_cada " #es mas de 1 foto
fi

comando_foto="$comando_foto -o $ruta/foto_%04d.jpg"

#echo $comando_foto

`$comando_foto`

exit 0






