#!/bin/bash
SIZE=150
BOXS=`echo "$SIZE+20" | bc`
DUBL=`echo "$SIZE*2"  | bc`
ls *.jpg | grep -v thumb | while read F; do
  G=`echo "$F-thumb.jpg" | sed 's|\.jpg-thumb|-thumb|'`
  convert "$F" -thumbnail "x$DUBL" -resize "${DUBL}x<" -resize 50% -gravity center -crop "${SIZE}x${SIZE}+0+0" +repage -format jpg -quality 90 "$G"
  echo "<td width='$BOXS'><a href='$F'><img src='$G' width='$SIZE' height='$SIZE'/></a></td>"
done
