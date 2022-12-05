#!/bin/bash

# Usage:
# ./03-bag.sh
# returns the sum of priorities of the duplicate items in the bag

toAscii() {
  LC_CTYPE=C printf '%d' "'$1"
}

toPriority() {
    asciiVal=$(toAscii $1)
    if [[ $asciiVal -ge 97 ]]; then
        echo $(($asciiVal - 96))
    else
        echo $(($asciiVal - 38))
    fi
}

echo "Calculating..."
while IFS= read -r line; do
    sectionLength=${#line}/2
    section1=${line:0:sectionLength}
    section2=${line:sectionLength}

    i=0
    found=false
    while [[ $found != true ]]
    do
        currentChar=${section1:$i:1}
        
        if [[ $section2 == *"$currentChar"* ]]; then
            thisPriority=$(toPriority $currentChar)
            sumOfPriorities=$((sumOfPriorities + $thisPriority))
            found=true
        fi
        ((i++))
    done
done < 03-bag.txt
    echo "Sum of priorities: $sumOfPriorities"