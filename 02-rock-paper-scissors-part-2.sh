#!/bin/bash

# Usage:
# ./02-rock-paper-scissors.sh
# returns total score for the proposed strategy in the file

echo "calculating..."

while IFS= read -r line; do
    strategy=$(echo ${line:0:3} | sed 's/[[:space:]]//')  

    elf=$(echo ${line:0:1} | sed 's/[[:space:]]//')  
    
    case $strategy in
        AY | BX | CZ) me=R ;;
        AZ | BY | CX ) me=P ;;
        AX | BZ | CY) me=S ;;
    esac

    case $me in
        R) choiceScore=1 ;;
        P) choiceScore=2 ;;
        S) choiceScore=3 ;;
    esac

    both=$elf$me
    
    case $both in
    AS | BR | CP ) gameScore=0 ;;
    AR | BP | CS ) gameScore=3 ;;
    AP | BS | CR ) gameScore=6 ;;
    esac

    scoreThisRound=$(($choiceScore + $gameScore))
    totalScore=$(($totalScore + $scoreThisRound))
done < 02-rock-paper-scissors.txt

echo "Total score: $totalScore"
