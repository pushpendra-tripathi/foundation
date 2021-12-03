png2svg_gapps() {
    if [ "$1" == "" ]; then
        echo Usage: $0 pngfile
        exit 0;
    fi

    FILE=`basename $1 .png`
    
    if [ ! -e $FILE.png ]; then
        echo $FILE.png does not exist
        exit 1;
    fi

    # convert $FILE.png -crop WxH+WOFF+HOFF $FILE_tmp.png
    convert $FILE.png -resize x132 $FILE_tmp.png
    convert -size 320x132 xc:white $FILE_tmp.png -gravity west -composite $FILE_gapp.png
    convert $FILE_gapp.png -transparent white $FILE_gapp.png
    convert $FILE.png $FILE.pnm
    potrace -s -o $FILE.svg $FILE.pnm
    rm $FILE.pnm
}

png2svg() {
    if [ "$1" == "" ]; then
        echo Usage: $0 pngfile
        exit 0;
    fi

    FILE=`basename $1 .png`
    
    if [ ! -e $FILE.png ]; then
        echo $FILE.png does not exist
        exit 1;
    fi

    convert $FILE.png -transparent white $FILE_tmp.png
    convert $FILE_tmp.png $FILE.pnm
    potrace -s -o $FILE.svg $FILE.pnm
    rm $FILE_tmp.png $FILE.pnm
}

pdf2jpg() {
  if [ "$1" == "" ]; then
    echo Usage: $0 "<filename.pdf>"
    exit 0;
  fi

  FILE=`basename $1 .pdf`
  echo ${FILE}

  convert -verbose -density 300 -trim $1 -quality 100 -flatten ${FILE}-%04d.png
}

img_padding() {
  if [ "$1" == "" ]; then
    echo Usage: $0 target padding bgcolor;
    exit 0
  fi

  if [ "$2" == "" ]; then
    padding=100
  else
    padding=$2
  fi

  w=$(( `identify -format %w $1` + $padding ))
  h=$(( `identify -format %h $1` + $padding ))

  if [ "$3" == "" ]; then
    bgcolor="white"
  else
    bgcolor=$3
  fi

  filename=$(basename "$1");
  extension="${filename##*.}";
  filename="${filename%.*}";
  FILE=$(basename "${1}" "${extension}");

  convert -size ${w}x${h} xc:${bgcolor} $1 -gravity center -composite ${filename}-padded.${extension};
}
