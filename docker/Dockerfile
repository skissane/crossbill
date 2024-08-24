FROM gcc:14.2.0-bookworm
RUN mkdir /src
ADD binutils-2.43.1.tar.gz /src/
ADD gcc-14.2.0.tar.gz /src/
RUN mkdir -p /cross/bin /build/binutils-2.43.1 /build/gcc-14.2.0
ENV PREFIX=/cross
ENV TARGET=i686-elf
ENV PATH=$PREFIX/bin:$PATH
RUN apt-get update
RUN apt-get install -y libgmp3-dev libmpc-dev libmpfr-dev texinfo
WORKDIR /build/binutils-2.43.1
RUN /src/binutils-2.43.1/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
RUN make
RUN make install
WORKDIR /build/gcc-14.2.0
RUN /src/gcc-14.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c --without-headers
RUN make -j4 all-gcc
RUN make -j4 all-target-libgcc
RUN make install-gcc
RUN make install-target-libgcc
