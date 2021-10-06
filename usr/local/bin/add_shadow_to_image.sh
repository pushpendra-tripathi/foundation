#!/bin/bash

if [[ -z $1 ]]; then
    echo "Usage: $(basename $0) <image-filename>"
    exit 0
fi

_formatpayment() {
    filename=$(basename "$1");
    extension="${filename##*.}";
    filename="${filename%.*}";
    FILE=$(basename ${1} ${extension});
    target="_${filename}.png";

    echo "$1"
    echo "---"
    if [ -f $1 ]; then
        w=`identify -format '%w' ${1}`
        wnew=$((w + 0))
        h=`identify -format '%h' ${1}`
        hnew=$((h + 0))

        echo "1. Add 100px to border: ${w}x${h} => ${wnew}x${hnew}"
        convert -size ${wnew}x${hnew} xc:white ${1} -gravity center -composite ${target};
        echo "2. Add shadow"
        convert ${target} \( +clone -background black -shadow 100x40+0+16 \) +swap -background none -layers merge +repage ${target}
        echo "3. Add transparent padding"
        convert ${target} -bordercolor none -border 32 ${target}
    else
        echo "File not found"
    fi
    echo
}

_formatpayment $1

# rm -v _a.png _b.png _c.png _d.png

if [[ $OSTYPE == darwin* ]]; then
  echo
  # open $1
fi
