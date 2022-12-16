#! /usr/bin/awk -f

BEGIN {FS="[,-]"}
{if ($1 && (($1 <= $3 && $2 >= $3 ) || ($1 >= $3 && $1 <= $4 ))) { overlapping++}}
END {print "overlapping:", overlapping}

