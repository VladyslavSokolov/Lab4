#!/bin/bash
if [ "$1" == "--logs" ]; then
	for i in {1..100}
	do
		filename="log${i}.txt"
		echo "Nazwa pliku: $filename" > "$filename"
		echo "Nazwa skryptu: skrypt1.sh" >> "$filename"
		echo "Data: $(date)" >> "$filename"
	done

	echo "Utworzono 100 plikow log."
	exit 0
fi

if [ "$1" == "--date" ]; then
	echo $(date)
	exit 0
fi

if [ "$1" == "--help" ]; then
	echo "Dostępne opcje"
	echo "--date - wyświetlenie dzisiejszej daty"
	echo "--logs - utworzenie 100 plików log"
	echo "--help - wyswietlenie pomocy"
	exit 0
fi

echo "Nieznana opcja. Użyj skrypt1.sh --help, aby uzyskać listę dostępnych opcji." 
