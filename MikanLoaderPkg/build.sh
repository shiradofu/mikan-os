#!/bin/sh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
EDK2DIR=$(cd "$SCRIPT_DIR/../edk2" && pwd)

rm -f "$EDK2DIR/MikanLoaderPkg"
ln -s "$SCRIPT_DIR" "$EDK2DIR/MikanLoaderPkg"

cd "$EDK2DIR" || exit 1
. edksetup.sh
sed -i '/ACTIVE_PLATFORM/ s:= .*$:= MikanLoaderPkg/MikanLoaderPkg.dsc:' Conf/target.txt
sed -i '/TARGET_ARCH/ s:= .*$:= X64:' Conf/target.txt
sed -i '/TOOL_CHAIN_TAG/ s:= .*$:= CLANGPDB:' Conf/target.txt
sed -i '/CLANGPDB/ s/-flto//' Conf/tools_def.txt
build
cp "$EDK2DIR/Build/MikanLoaderX64/DEBUG_CLANGPDB/X64/Loader.efi" "$SCRIPT_DIR/Loader.efi"
