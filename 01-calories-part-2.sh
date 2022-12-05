#!/bin/bash

# Usage:
# ./0-calories
# returns the sum of the calories owned by the three elves with the most calories
# assumes empty line at end of input file

thisElf=0
maxElf1=0
maxElf2=0
maxElf3=0

while IFS= read -r line; do
    digitsOnly=$(echo $line | sed 's/[^0-9]//g')
    if [[ ! -z $digitsOnly  ]]; then
        thisElf=$(($thisElf + $digitsOnly))
    else
        if [[ $thisElf -gt $maxElf1 ]]; then
            maxElf3=$maxElf2
            maxElf2=$maxElf1
            maxElf1=$thisElf
        elif [[ $thisElf -gt $maxElf2 ]]; then
            maxElf3=$maxElf2
            maxElf2=$thisElf
        elif [[ $thisElf -gt $maxElf3 ]]; then
            maxElf3=$thisElf
        fi
        thisElf=0
    fi


done < 01-calories.txt

sumOfThree=$(($maxElf1 + $maxElf2 + $maxElf3))

cat << EndOfMessage
Highest: $maxElf1
2nd highest: $maxElf2
3rd highest: $maxElf3

Total: $sumOfThree
EndOfMessage
