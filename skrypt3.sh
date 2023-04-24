#!/bin/bash

if [ "$1" == "--logs" ]; then
	if [ "$2" -eq "$2" ] 2>/dev/null; then
		n=$2
	else
		echo "Nieprawidłowy argument. Podaj liczbę plików do utworzenia."
		exit 1
	fi
	for i in $(seq 1 $n)
	do
		filename="log${i}.txt"
		echo "Nazwa pliku: $filename" > "$filename"
		echo "Nazwa skryptu: skrypt.sh" >> "$filename"
		echo "Data: $(date)" >> "$filename"
	done

	echo "Utworzono $n plików log."
	exit 0
fi

if [ "$1" == "--date" ]; then
	echo $(date)
	exit 0
fi

if [ "$1" == "--help" ]; then
	echo "Dostępne opcje:"
	echo "--date - wyświetlenie dzisiejszej daty"
	echo "--logs [liczba] - utworzenie określonej liczby plików log"
	echo "--help - wyświetlenie pomocy"
	exit 0
fi

echo "Nieznana opcja. Użyj skrypt.sh --help, aby uzyskać listę dostępnych opcji."
