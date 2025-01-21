all: build/libc_ucontext.lib.so

# XXX arm_v8a ARCH detection missing XXX

build/libc_ucontext.lib.so: Makefile build/getcontext.o build/swapcontext.o
	$(CC) -o build/libc_ucontext.lib.so -Wl,-soname=libc_ucontext.lib.so \
	      -shared $(subst ",,$(MAKE_SHARED_LINKER_FLAGS)) \
	      -Wl,-z noexecstack -Wl,--hash-style=sysv \
	      build/getcontext.o build/swapcontext.o

build/%.o: x86_64/%.S
	mkdir -p build
	$(CC) -c $< -o $@
