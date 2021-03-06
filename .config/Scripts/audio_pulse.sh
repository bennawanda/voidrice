#!/bin/bash

#This is the ffmpeg command that the audio shortcut in i3 will run.

#Picks a file name for the output file based on availability:

if [[ -f ~/output.flac ]]
	then
		n=1
		while [[ -f $HOME/output_$n.flac ]]
		do	
			n=$((n+1))
		done
		filename="$HOME/output_$n.flac"
	else
		filename="$HOME/output.flac"
fi

#The actual ffmpeg command:

ffmpeg \
-f alsa -i default \
-c:a flac \
$filename
