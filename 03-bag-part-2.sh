#!/bin/bash

# Usage:
# ./03-bag-part-.sh
# returns the sum of priorities of the items that are duplicated in bags grouped by 3

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
while read  bag1; read  bag2; read  bag3
    do
    i=0
    found=false
    alreadyChecked=""
    while [[ $found != true ]]
    do
        currentChar=${bag1:$i:1}
        if [[ $alreadyChecked == *"$currentChar"* ]]; then
            ((i++))
            continue
        fi

        if [[ $bag2 == *"$currentChar"* && $bag3 == *"$currentChar"*  ]]; then
            thisPriority=$(toPriority $currentChar)
            sumOfPriorities=$((sumOfPriorities + $thisPriority))
            found=true
        fi
        alreadyChecked=${currentChar}${alreadyChecked}
        ((i++))
    done
done < 03-bag.txt
    echo "Sum of priorities: $sumOfPriorities"