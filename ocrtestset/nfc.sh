#!/bin/bash
# 2016-02-17, Uwe Springmann
# NFC normalize text files
# assumption: filenames have extensions .txt, .hocr, .xml, .llocs
# usage: ./nfc.sh (run from your project directory)

# loop over files in project directory; no hidden directories
shopt -u dotglob
find * | while read f; do 
    ext="${f##*.}"
    # normalize txt, hocr, xml, llocs files only
    if [ "$ext" == "txt" ] || [ "$ext" == "hocr" ] || \
       [ "$ext" == "xml" ] || [ "$ext" == "llocs" ]; then
    echo "NFC normalizing " $f
        uconv -f utf8 -t utf8 -x nfc -o "$f".nfc "$f"
    fi
done
    
# convert back to original file name 
find * | while read f; do
    ext="${f##*.}"
    # nfc extension only
    if [ "$ext" == "nfc" ]; then
        mv "$f" "${f/.nfc/}"
    fi
done
