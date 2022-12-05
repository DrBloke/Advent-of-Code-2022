#!/bin/bash

# Usage:
# ./0-calories
# returns the calories of the elf with the most calories
# assumes empty line at end of input file

thisElf=0
maxElf=0

while IFS= read -r line; do
    digitsOnly=$(echo $line | sed 's/[^0-9]//g')
    if [[ ! -z $digitsOnly  ]]; then
        thisElf=$(($thisElf + $digitsOnly))
    else
        if [[ $thisElf -gt $maxElf ]]; then
            maxElf=$thisElf
            
            # uncomment below if you want to see maximum changing over time
            echo "max elf $maxElf"
        fi
        thisElf=0
    fi

done < 01-calories.txt
