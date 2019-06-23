 #!/bin/sh -x
 # Use it if you neither have V and Vorac
 echo Moving to HOME
 cd ~
 echo Creating 'code' directory
 mkdir code && cd code
 echo Cloning V..
 git clone https://github.com/vlang/v
 cd v/compiler
 wget https://vlang.io/v.c
 echo Compiling V..
 cc -std=c11 -w -o vc v.c
 echo Self-compiling V..
 ./vc -o v .
 echo Testing compiler..
 ./v -o v .
rm vc
# Now build Vorac
sh build.sh
