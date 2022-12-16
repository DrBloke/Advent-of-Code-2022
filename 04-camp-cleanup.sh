#! /usr/bin/awk -f
BEGIN {FS="[,-]"}
{if ($1 && (($1 <= $3 && $2 >= $4 ) || ($1 >= $3 && $2 <= $4 ))) { contained++}}
END {print "contained:", contained}

