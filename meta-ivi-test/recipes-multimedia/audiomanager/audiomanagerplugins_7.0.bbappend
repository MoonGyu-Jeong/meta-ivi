FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"
SRC_URI:append += " \
    file://remove_add_gmock.patch \
    file://${BPN}_t-${PV}.inc \
    "

EXTRA_OECMAKE:remove = "-DWITH_TESTS=OFF"
EXTRA_OECMAKE:append = " -DWITH_TEST_CONTROLLER=ON -DWITH_TESTS=ON"

DEPENDS += "gtest gmock"

do_install:append() {
    make plugin-test-install
    mv ${D}/opt/tests/audiomanager ${D}/opt/tests/${PN}

    install -m 0755 ${WORKDIR}/${BPN}_t-${PV}.inc ${D}/opt/tests/${PN}/${BPN}_t.inc
}

PACKAGES += " ${PN}-test"

FILES_${PN}-dbg += "/opt/tests/${PN}/.debug/* "
FILES_${PN}-test = "/opt/tests/${PN}/ "
