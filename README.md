# ゼロからの OS 自作入門

Mac 用の設定 ([参考](https://qiita.com/yamoridon/items/4905765cc6e4f320c9b5))

## EDK II

```sh
printf "[diff]\n        ignoreSubmodules = all\n" >> .git/config
git clone https://github.com/tianocore/edk2.git
cd edk2 && git submodule init && git submodule update
make -C BaseTools/Source/C
brew install nasm
```

## LLVM

```sh
brew install llvm

export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/llvm/include"
export PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"
```

## QEMU

```
brew install qemu dosfstools
```
