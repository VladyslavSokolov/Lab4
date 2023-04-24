#!/bin/bash

# Ustawienie domyślnych wartości
num_logs=100
num_errors=100

# Obsługa opcji
while getopts ":hdl:e:" opt; do
  case ${opt} in
    h )
      # Wyświetlenie pomocy
      echo "Usage: skryptflag.sh [OPTIONS]"
      echo "Options:"
      echo "  -h, --help        Display this help message"
      echo "  -l, --logs [NUM]  Create NUM log files (default: 100)"
      echo "  -d, --date        Display the current date"
      echo "  -e, --error [NUM] Create NUM error files (default: 100)"
      exit 0
      ;;
    d )
      # Wyświetlenie daty
      date
      exit 0
      ;;
    l )
      # Ustawienie liczby plików log
      num_logs=$OPTARG
      ;;
    e )
      # Ustawienie liczby plików error
      num_errors=$OPTARG
      ;;
    \? )
      # Błędna opcja
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
    : )
      # Opcja wymaga wartości
      echo "Option -$OPTARG requires an argument." 1>&2
      exit 1
      ;;
  esac
done

# Utworzenie plików log
for ((i=1;i<=num_logs;i++)); do
  echo "File name: log$i.txt" > log$i.txt
  echo "Script name: skrypt.sh" >> log$i.txt
  echo "Date: $(date)" >> log$i.txt
done

# Utworzenie plików error
for ((i=1;i<=num_errors;i++)); do
  mkdir error$i
  echo "Error file: error$i.txt" > error$i/error$i.txt
done
