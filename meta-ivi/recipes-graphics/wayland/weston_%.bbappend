PR = "r3"

DEPENDS += "xkeyboard-config"
RDEPENDS_${PN} += "xkeyboard-config"

FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

FILES_${PN} += "${libdir}/weston/*"
FILES_${PN}-dbg += "${libdir}/weston/.debug/*"

