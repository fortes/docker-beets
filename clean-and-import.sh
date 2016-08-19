#!/bin/sh

echo "Cleaning files in place ..."
mp3val -f -nb ./**/*.mp3

echo "Importing"
beet import . "$@"
