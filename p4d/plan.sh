pkg_origin=js
pkg_name=p4d
pkg_version="16.1"
pkg_maintainer="Balazs Nagy <julsevern@gmail.com>"
pkg_license=(Proprietary)
pkg_source="http://ftp.perforce.com/perforce/r${pkg_version}/bin.linux26x86_64/p4d"
pkg_shasum="ae010ec55f92cfacc398b07b6b09cb2128c0d30c673cd62f7813f2b0f3295a28"
pkg_filename=p4d
pkg_deps=(core/glibc js/p4)
pkg_build_deps=(core/patchelf)
pkg_bin_dirs=(bin)

pkg_expose=(1666)
do_unpack() {
    return 0
}

do_build() {
    return 0
}

do_strip() {
    return 0
}

do_install() {
    mkdir -p $pkg_prefix/bin
    cp /hab/cache/src/$pkg_filename $pkg_prefix/bin
    chmod 755 $pkg_prefix/bin/$pkg_filename
    patchelf --set-interpreter "$(pkg_path_for glibc)/lib/ld-linux-x86-64.so.2" $pkg_prefix/bin/$pkg_filename
}
