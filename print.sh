#!/bin/bash
#
# Print via bash script example
# Change the lp command and PRINTER_NAME if needed
#
# Needs imagemagick installed! Install from Terminal via
# sudo apt install imagemagick -y
#

PICTURE="$1"
PRINTER_NAME="Printi"
width="$(identify -format '%w' $PICTURE)"
height="$(identify -format '%h' $PICTURE)"

TMP_COLLAGE="/var/www/html/private/tmp_collage.jpg"
TMP_COLLAGEPRINT="/var/www/html/private/tmp_collageprint.jpg"

# variables for additional white pixel that we will add to the photo for better results when cutting.
H2="/var/www/html/private/horizontal2mm.jpg"
V2="/var/www/html/private/vertical2mm.jpg"
H3="/var/www/html/private/horizontal3mm.jpg"

# => uncomment next line for debug
# echo "triggerd with cmd line param: $PICTURE" >> /var/www/html/private/print.log

# Check if width is smaller than height (Collage)
if [[  $height -eq 584  ]]; then
    # Photostripe
    
    # => uncomment next line for debug
    #echo “Collage“ >>/var/www/html/private/print.log
    
    # Collage
    # stack image horizontal with +append vertical with -append
    convert $H3 $H3 $PICTURE $PICTURE $H2 $H2 -append $TMP_COLLAGE
    convert $V2 $V2 $V2 $TMP_COLLAGE $V2 +append $TMP_COLLAGEPRINT

    # print 
    lp -d $PRINTER_NAME -o media=w288h432-div2 -o landscape -o fit-to-page $TMP_COLLAGEPRINT
    
    # => uncomment next line for debug
    # echo "$TMP_COLLAGE" >> /var/www/html/private/print.log
    
else
    # Photo
    
    # => uncomment next line for debug
    # echo “Photo height: $height width: $width“ >>/var/www/html/private/print.log
    
    lp -d $PRINTER_NAME -o orientation-requested=3 -o fit-to-page $PICTURE

    # => uncomment next line for debug
    # echo "printed " >>/var/www/html/private/print.log
fi
