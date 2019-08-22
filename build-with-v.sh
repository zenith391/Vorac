#!/bin/sh
# Use it if you neither have V and Vorac
echo Moving to HOME
cd ~
echo Cloning V..
git clone https://github.com/vlang/v && cd v
make
rm v.c
# Now build Vorac
sh build.sh
