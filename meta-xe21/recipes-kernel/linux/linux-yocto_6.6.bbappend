FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Specify the kernel source URL and branch
SRC_URI += "file://fragment.cfg"

do_configure:prepend() {
    install -m 0644 ${WORKDIR}/fragment.cfg ${S}/
}
