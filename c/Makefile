all: hello.efi

%.o: %.c
	clang -target x86_64-pc-win32-coff \
		-mno-red-zone -fno-stack-protector -fshort-wchar -Wall -o $@ -c $<

%.efi: %.o
	lld-link /subsystem:efi_application /entry:EfiMain /out:$@ $<

.PHONY: copy
copy: hello.efi
	../copy.sh c/hello.efi

clean:
	rm -f hello.efi
