LFS=/mnt/lfs

cd /mnt/lfs/sources
tar -xf gcc-13.2.0.tar.xz

tar -xf ../mpfr-4.2.1.tar.xz
mv -v mpfr-4.2.1 mpfr

tar -xf ../gmp-6.3.0.tar.xz
mv -v gmp-6.3.0 gmp

tar -xf ../mpc-1.3.1.tar.gz
mv -v mpc-1.3.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v /gcc-13.2.0/build
cd /gcc-13.2.0/build
