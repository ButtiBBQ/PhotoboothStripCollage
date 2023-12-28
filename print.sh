#!/bin/bash
#
# Print via bash script example
# Change the lp command and PRINTER_NAME if needed
#
# Needs imagemagick installed! Install from Terminal via
# sudo apt install imagemagick -y
#
#

PICTURE="$1"
PRINTER_NAME="Printi"
width="$(identify -format '%w' $PICTURE)"
height="$(identify -format '%h' $PICTURE)"

TMP_COLLAGE="/var/www/html/private/tmp_collage.jpg"
TMP_COLLAGEPRINT="/var/www/html/private/tmp_collageprint.jpg"
TMP_PHOTO="/var/www/html/private/tmp_photo.jpg"
H2="/var/www/html/private/horizontal2mm.jpg"
V2="/var/www/html/private/vertical2mm.jpg"
H3="/var/www/html/private/horizontal3mm.jpg"

echo "triggerd with cmd line param: $PICTURE" >> /var/www/html/private/print.log

# Check if width is smaller than height (Collage)
if [[  $height -eq 584  ]]; then
    echo “Collage“ >>/var/www/html/private/print.log
    # Collage
    # stack image horizontal with +append
    convert $H3 $PICTURE $PICTURE $H2 -append $TMP_COLLAGE
    convert $V2 $V2 $TMP_COLLAGE +append $TMP_COLLAGEPRINT
#    lp -d "Printi" -o media=w288h432-div2 -o landscape -o fit-to-page $TMP_COLLAGEPRINT
    echo "$TMP_COLLAGE" >> /var/www/html/private/print.log
else
    # Photo
    #convert $PICTURE $PICTURE -append $TMP_PHOTO # stack images vertical
    echo “Photo height: $height width: $width“ >>/var/www/html/private/print.log
#    lp -d $PRINTER_NAME -o orientation-requested=3 -o fit-to-page $TMP_PHOTO
    echo "printed " >>/var/www/html/private/print.log
fi