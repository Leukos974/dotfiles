#!/bin/bash

Language=$(setxkbmap -query | grep layout | cut -d':' -f2 | xargs)

if [ "$Language" = "fr" ]; then
    setxkbmap us
    echo "Switched to US qwerty"
else
    setxkbmap fr
    echo "Switched to FR azerty"
fi
