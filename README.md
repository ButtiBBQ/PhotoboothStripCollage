# PhotoboothStripCollage
Collage for foto strips to cut and print with DI-RX1

# Setup:
1. copy following files to /var/www/html/private
    - collage.json
    - horizontal2mm.jpg
    - horizontal3mm.jpg
    - vertical2mm.jpg
    - print.sh
2. adjust the printer.sh with your printer name
3. make the print.sh executable by command line: chmod +x /var/www/html/private/print.sh
4. install imagemagick by running command: sudo apt install imagemagick -y
5. in AdminPanel ( http://fotobox/admin/#commands ) set the command to print to: /var/www/html/private/print.sh %s
6. in AdminPanel set the collage resolution to 300DPI
7. set Choose collage layout to private/collage.json
8. done :)

<img src="https://github.com/ButtiBBQ/PhotoboothStripCollage/blob/main/sample.jpg" alt="sample image" width="200"/> 
