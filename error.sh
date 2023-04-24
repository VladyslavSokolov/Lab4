#!/bin/bash

generate_error_files () {
	for ((i=1;i<=$1;i++)); do
        mkdir -p error$i
        for ((j=1;j<=100;j++)); do
            echo "Error file $j" > error$i/error$j.txt
        done
    done
}

if [ "$1" = "--init" ]; then
    git clone https://github.com/VladyslavSokolov/Lab4.git
    export PATH=$PATH:/path/to/repo
    echo "Repo cloned and added to PATH"
elif [ "$1" = "--logs" ]  [ "$1" = "-l" ]; then
    if [ "$2" = "" ]; then
        for ((i=1;i<=100;i++)); do
            echo "Log file $i" > log$i.txt
            echo "Created log file log$i.txt with script3.sh and date $(date)" >> log$i.txt
        done
    else
        for ((i=1;i<=$2;i++)); do
            echo "Log file $i" > log$i.txt
            echo "Created log file log$i.txt with script3.sh and date $(date)" >> log$i.txt
        done
    fi
elif [ "$1" = "--date" ]  [ "$1" = "-d" ]; then
    echo $(date)
elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if [ "$2" = "" ]; then
        generate_error_files 100
    else
        generate_error_files $2
    fi
else
    echo "Usage: skrypt3.sh"
    echo ""
    echo "Options:"
    echo "  --init       Clone repository and add to PATH"
    echo "  --logs       Create log files (default: 100)"
    echo "  --logs [n]   Create n log files"
    echo "  --date       Display current date"
    echo "  --error      Create error files (default: 100)"
    echo "  --error [n]  Create n error files"
    echo "  -h, --help   Display this help and exit"
fi
