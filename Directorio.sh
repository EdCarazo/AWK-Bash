#!/bin/bash
	for i in $( ls ); do
		echo item: $i
		if [ -d $1 ]; then
			echo " es directorio"
		else
			echo " es archivo"
		fi

	done
