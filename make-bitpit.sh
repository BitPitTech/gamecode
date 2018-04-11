set -e
#Tip: You can create a supermake.local file and this script will get the variable from there!
BINNAME=/Users/kzaher/Projects/Quake-III-Arena/build/release-darwin-x86_64/ioquake3.x86_64
MODNAME=bitpit
#ARCH should be either i386 (32 bit) or x86_64 (64 bit)
ARCH=x86

if [ -r ./supermake.local ] ; then
source ./supermake.local
fi

#Create the mod dir
mkdir -p ~/Library/Application\ Support/bitpit/$MODNAME

#Build, pak it and start 
pushd .
make BASEGAME=$MODNAME && cd build/release-darwin-$ARCH/${MODNAME} && zip -r ~/Library/Application\ Support/bitpit/$MODNAME/pak9.pk3 vm
popd

. ./update-bitpit.tar.gz.sh
#$BINNAME +set fs_game $MODNAME +set debug 1 +set sv_pure 0 +vm_ui 2 +vm_game 2 +vm_cgame 2

