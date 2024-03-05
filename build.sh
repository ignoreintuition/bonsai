#!/bin/bash

# Build mgs
/Applications/PICO-8.app/Contents/MacOS/pico8 bonsai.p8 -export dist/bonsai.p8.png

# Run mgs
/Applications/PICO-8.app/Contents/MacOS/pico8 -windowed 0 -run bonsai.p8 