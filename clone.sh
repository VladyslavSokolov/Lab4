#!/bin/bash

if [ "$1" = "--init" ]; then
	git clone https://github.com/VladyslavSokolov/Lab4.git
	export PATH=$PATH:$(pwd)/Lab4
	echo "Repozytorium zostało pomyślnie sklonowane i ścieżka została dodana do zmiennej środowiskowej PATH."
	exit 0
fi
