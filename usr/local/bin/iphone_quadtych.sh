#!/bin/bash

if [[ -z $1 ]]; then
    echo "Usage: $(basename $0) <source_prefix>"
    exit 0
fi

# Convert 4 iPhone screenshots into a quadtych
for x in a b c d; do 
    source="source_prefix_${x}.png";
    hideextension ${source}; 
    lockfile ${source}; 
    convert -size 1560x3012 xc:white ${source} -gravity center -composite _${x}.png; 
done
convert +append _a.png _b.png _c.png _d.png _abcd.png
convert -size 6390x3162 xc:white _abcd.png -gravity center -composite _abcd.png 

