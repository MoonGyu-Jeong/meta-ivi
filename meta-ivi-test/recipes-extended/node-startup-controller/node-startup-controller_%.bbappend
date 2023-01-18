#
# for test
#
FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"
SRC_URI:append += " \
    file://helper.zip \
    file://${BPN}_t.inc \
    "

do_install:append() {
   install -d ${D}/opt/tests/${PN}
   install -m 0755 ${WORKDIR}/helper/*.sh ${D}/opt/tests/${PN}
   install -m 0644 ${WORKDIR}/helper/*.service ${D}/${systemd_unitdir}/system

   install -m 0755 ${WORKDIR}/${BPN}_t.inc ${D}/opt/tests/${PN}

   mv ${D}/etc ${D}/opt/tests/${PN}
}

FILES_${PN}-nsm-dummy += " \
   /opt/tests/${PN}/ \
   ${systemd_unitdir}/system/example.service \
   ${systemd_unitdir}/system/hello.service \
   "

PACKAGES += "${PN}-nsm-dummy"
