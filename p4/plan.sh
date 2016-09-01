pkg_origin=js
pkg_name=p4
pkg_version="16.1"
pkg_maintainer="Balazs Nagy <julsevern@gmail.com>"
pkg_license=(Proprietary)
pkg_source="http://ftp.perforce.com/perforce/r${pkg_version}/bin.linux26x86_64/p4"
pkg_shasum="3176b5f795cec541896c4866d79eb68ff50ede5f14f42ddb273cb57e8597f893"
pkg_filename=p4
pkg_deps=(core/glibc)
pkg_build_deps=(core/patchelf)
pkg_bin_dirs=(bin)

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
