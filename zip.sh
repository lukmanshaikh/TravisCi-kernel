# Main Environment
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
ZIP_DIR=$KERNEL_DIR/AnyKernel2


		echo -e "\n(i) Cloning toolcahins if folder not exist..."
		git clone https://github.com/raza231198/aarch64-linux-android-4.9

                echo -e "\n(i) Cloning AnyKernel2 if folder not exist..."
		git clone -b land https://github.com/lukmanshaikh/AnyKernel2

		cd $ZIP_DIR
		cp $KERN_IMG $ZIP_DIR/zImage
		make normal
