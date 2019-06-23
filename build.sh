#!/bin/sh -x
#This file is only to be used if you can't build Vorac with Vorac
echo Building..
v -o vorac src/main.v
# Build itself
echo Re-building Vorac..
./vorac
echo Have fun with Vorac!
