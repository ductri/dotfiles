#!/bin/bash
echo "$1"
if [[ $2 -eq "" ]]; then
    echo "print it all"
    cat "$1" | ssh desktop lpr -o sides=two-sided-long-edge  -T test
    # cat "$1" | ssh desktop lpr -o  sides=one-sided
else
    echo "print pages $2 to $3"
    cat "$1" | ssh desktop lpr -o page-ranges=$2-$3 -o sides=two-sided-long-edge
fi

