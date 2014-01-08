#!/bin/bash
#-*-ENCODING:UTF-8-*-

#variables
ruta="/home/pi/video"
let tiempo=30000 #son 30 segundos
let num_fotos=$1
fecha=`date +"%Y-%m-%d_%k-%M-%S"`

#echo "Grabando video por $1 minutos"

if [ "$1" != "" ];
then
	let tiempo=$1*60000 #minutos
fi

raspivid -t $tiempo -o $ruta/$fecha.h264 -w 1280 -h 720

#echo "Convirtiendo el video $ruta/$fecha.h264 a MP4"

MP4Box -fps 30 -add $ruta/$fecha.h264 $ruta/$fecha.mp4 > /dev/null 2>&1

#echo "Ya convertido el video, borro anterior."

rm -rf $ruta/$fecha.h264

exit 0

