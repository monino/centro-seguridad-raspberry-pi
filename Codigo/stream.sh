#!/bin/bash
#-*-ENCODING:UTF-8-*-
su pi -c "raspivid -o - -t 99999 -hf -w 640 -h 360 -fps 25|cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264"

