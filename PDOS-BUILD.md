# Building PDOS

1. `./run.sh` to build and enter Docker container
2. `cd /work/modules/pdos/pdpclib`
3. `make -f makefile.pde`

I picked that because `makefile.pde` seemed closest to what I want to do.  At
first it didn't work at all, because `make` in this container is GNU make, and
that makefile has recipe command lines without an initial tab:
```
makefile.pde:12: *** missing separator.  Stop.
```
So I had to edit the file to replace the leading whitespace on those lines with
a tab:
```
sed -i -e 's@^\s\+@\t@' makefile.pde
```

Trying `make -f makefile.pde` again:
```
i686-elf-gcc -S -Os -fno-common -I. -I../src -D__32BIT__ -D__PDOS386__ -fleading-underscore -o stdio.s stdio.c
stdio.c: In function 'iread':
stdio.c:2606:36: error: implicit declaration of function '__magic' [-Wimplicit-function-declaration]
 2606 |                         genuine = (__magic() == 0x1234);
      |                                    ^~~~~~~
make: *** [makefile.pde:35: stdio.o] Error 1
```

Simple fix: edit `stdio.c`, find this line (at time of writing line 125):
```
extern void CTYP __devsinfo(int handle, unsigned int info);
```
Immediately after that, add this line:
```
extern int CTYP __magic(void);
```

Next we try `make -f makefile.pde` again.

This time it successfully builds `pdptest.exe`
