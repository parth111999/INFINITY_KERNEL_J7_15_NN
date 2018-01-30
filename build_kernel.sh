#credits to kunal for this awesome script 
# Init Script
KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/arch/arm64/boot/Image
BUILD_START=$(date +"%s")

# Color Code Script
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
nocol='\033[0m'         # Default

# Tweakable Options Below
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER="parth111999"
export KBUILD_BUILD_HOST="infinityserver"
export CROSS_COMPILE="/home/parth111999/Desktop/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-"

# Compilation Scripts Are Below
compile_kernel ()
{
echo -e "$RED***********************************************"
echo "  WARNING - YOU ARE ABOUT BRICK YOUR PC
 stay grounded xD       "
echo -e "***********************************************$nocol"
make clean && make mrproper
make j7elte_defconfig
make -j4
if ! [ -a $ZIMAGE ];
then
echo -e "$Red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi
}

# Finalizing Script Below
case $1 in
clean)
make ARCH=arm -j3 clean mrproper
rm -rf include/linux/autoconf.h
;;
*)
compile_kernel
;;
esac
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$Yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
