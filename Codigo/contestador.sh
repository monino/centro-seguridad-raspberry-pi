#!/bin/bash
#-*-ENCODING:UTF-8-*-

case $1 in
        foto)
		if [ "$2" = "" ];
		then 
			echo "Hago una foto."
			/usr/local/bin/foto.sh 1 &
		else
			echo "Hago $2 fotos"
			/usr/local/bin/foto.sh $2 &
		fi		
        ;;
        video)
		if [ "$2" = "" ];
		then 
			echo "Grabado video por 30 seg."
			/usr/local/bin/video.sh &
		else
			echo "Grabado video por $2 minutos"
			/usr/local/bin/video.sh $2 &
		fi		
        ;;
        stream)
		if [ "$2" = "on" ];
		then 
			echo "Enciendo el stream."
			/usr/local/bin/stream.sh &
		elif [ "$2" = "off" ];
		then
			echo "Apago el stream."
			killall vlc raspivid
		else
			echo "No te entiendo cabeza"
		fi		
        ;;		
        subir)	
		if [ "$2" = "fotos" ];
		then 
			echo "Subo las fotos..."
			sudo /usr/local/bin/subir.sh $2
			echo "Todo subido"
			exit 0
		elif [ "$2" = "video" ];
		then
			echo "Subo videos..."
			sudo /usr/local/bin/subir.sh $2
			echo "Todo subido"
			exit 0
		else
			echo "No te entiendo cabeza"
		fi
        ;;		
        borrar)
                echo "Borro fotos y videos";
		/usr/local/bin/borrar.sh &
        ;;				
        espacio)
                echo "El sistema tiene libre `df -h | grep rootfs | awk '{ print $4,$5 }'` ocupado";
        ;;		
        temperatura)
                echo "La temperatura de la raspi es "
		sudo /opt/vc/bin/vcgencmd measure_temp
        ;;		
        equipos)
                echo "Equipos conectados: "
		sudo python /usr/local/bin/equipos.py &
        ;;					
        apagar)
                echo "Apagando..."
                telinit 0
        ;;					
        reiniciar)
                echo "Reiniciando..."
                telinit 6
        ;;				
        *)
                echo "$1 no lo entiendo, los comandos que entiendo son: espacio, temperatura, foto, grabar, parar, subir, apagar y mas"
 ;;
esac
