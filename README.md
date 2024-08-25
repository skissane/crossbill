# crossbill

Trying to build a GCC cross-compiler for hobby OS development in a Docker container.

Why is it called "crossbill"?
Well, "crossbuild" seemed a bit too obvious, and "crossbill" sounds kind of similar.

Inspired by https://wiki.osdev.org/GCC_Cross-Compiler

Notes:
- Assumes your user account is UID `1000`. Edit `docker/Dockerfile` and change
  `ENV CROSSBUILD_UID=1000` line if it is not.

# Building PDOS

See steps in file [`PDOS-BUILD.md`](./PDOS-BUILD.md)
