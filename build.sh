# Main Environment
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
ZIP_DIR=$KERNEL_DIR/AnyKernel2
CONFIG_DIR=$KERNEL_DIR/arch/arm64/configs
CONFIG=land_defconfig
CORES=$(grep -c ^processor /proc/cpuinfo)
THREAD="-j$CORES"

echo -e "\n(i) Cloning toolcahins ..."
rm -rf $PWD/aarch64-linux-android-4.9
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9

echo -e "\n(i) Cloning clang if folder not exist..."
git clone https://github.com/lukmanshaikh/aosp-clang clang

# Export
export ARCH=arm64
export SUBARCH=arm64
PATH="$PWD/clang/bin:$PWD/aarch64-linux-android-4.9/bin/:${PATH}"
export CC=clang
CLANG_TRIPLE=aarch64-linux-gnu-
CROSS_COMPILE=$PWD/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export KBUILD_BUILD_USER=luqman
export KBUILD_BUILD_HOST=unique
make  O=out $CONFIG $THREAD
