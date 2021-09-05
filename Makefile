prefix = /usr/local

test_memory:
	sh tests_compiler.sh memory
	sh tests_asmer.sh memory
	sh tests_linker.sh memory

check: install test

test:
	sh tests_compiler.sh
	sh tests_asmer.sh
	sh tests_linker.sh
install:
	rm -rf $(prefix)/lib/copkg/*
	cp -r runtime/pkg/* $(prefix)/lib/copkg/

	rm -rf $(prefix)/lib/coasm/*
	#cp -r runtime/internal/* $(prefix)/lib/coasm/
	cp -r runtime/syscall/* $(prefix)/lib/coasm
