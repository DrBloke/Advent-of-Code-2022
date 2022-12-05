#!/bin/bash

# Usage:
# ./02-rock-paper-scissors.sh
# returns total score for the proposed assumed strategy in the file

echo "calculating..."

while IFS= read -r line; do
    both=$(echo ${line:0:3} | sed 's/[[:space:]]//')  
    me=${line:2:1}
    
    case $me in
        X) choiceScore=1 ;;
        Y) choiceScore=2 ;;
        Z) choiceScore=3 ;;
    esac

    case $both in
    AZ | BX | CY ) gameScore=0 ;;
    AX | BY | CZ ) gameScore=3 ;;
    AY | BZ | CX ) gameScore=6 ;;
    esac

    scoreThisRound=$(($choiceScore + $gameScore))
    totalScore=$(($totalScore + $scoreThisRound))
done < 02-rock-paper-scissors.txt

echo "Total score: $totalScore"
