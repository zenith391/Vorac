#!/bin/sh
mkdir bin
mkdir src
echo Cloning Vorac:
git clone https://github.com/zenith391/Vorac
cd Vorac
mkdir bin
echo Building Vorac:
sh build.sh
cd ..
cp Vorac/vorac vorac
rm -f -r Vorac
echo All you have to do is create your Voracer file.
