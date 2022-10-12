hello.o: hello.c
	clang -target x86_64-pc-win32-coff \
		-mno-red-zone -fno-stack-protector -fshort-wchar -Wall -o $@ -c $<

hello.efi: hello.o
	lld-link /subsystem:efi_application /entry:EfiMain /out:$@ $<

.PHONY: run
run:
	../qemu/run.sh hello.efi

.PHONY: clean
clean:
	rm -f *.o hello.efi disk.img
