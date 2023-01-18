FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI:append_vexpressa9 = " file://securetty-vea9"

do_configure:prepend_vexpressa9 () {
    cat ${WORKDIR}/securetty-vea9 >> ${WORKDIR}/securetty
}
