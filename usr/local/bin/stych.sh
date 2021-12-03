#!/bin/bash

if [[ -z $2 ]]; then
    echo "Usage: $(basename $0) output_file_name input_file ..."
    echo "Must specify output file name and at least one input file"
    exit 0
fi

output_file=$1
input_files=${@:2}
image_files=()

max_w=0
max_h=0
for raw in ${input_files[@]}; do 
    # protect input files
    # hideextension ${raw}; 
    # lockfile ${raw};

    img=_${raw}.png
    image_files+=(${img})

    # convert file 
    convert ${raw} +profile "*" ${img}

    # get max height and width of all files
    w=`identify -format '%w' ${img}`
    if [[ w -gt max_w ]]; then
        max_w=${w};
    fi

    h=`identify -format '%h' ${img}`
    if [[ h -gt max_h ]]; then
        max_h=${h};
    fi

    echo "${raw} (${w} x ${h})"
done

for img in ${image_files[@]}; do
    # resize file and normalize height
    convert ${img} -resize x${max_h} +profile "*" ${img};

    w=`identify -format '%w' ${img}`
    new_w=$((w + 100))
    h=`identify -format '%h' ${img}`
    new_h=$((h + 200))

    convert -size ${new_w}x${new_h} xc:white ${img} -gravity center -composite ${img}
    
done

convert +append ${image_files[@]} ${output_file}
w=`identify -format '%w' ${output_file}`
h=`identify -format '%h' ${output_file}`
w=$((w + 100))
convert -size ${w}x${h} xc:white ${output_file} -gravity center -composite ${output_file}

# Cleanup
for img in ${image_files[@]}; do
    rm -v ${img}
done

open ${output_file}
