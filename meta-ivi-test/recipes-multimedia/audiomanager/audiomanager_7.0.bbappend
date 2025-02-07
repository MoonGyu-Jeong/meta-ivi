FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"
SRC_URI:append += " \
    file://${BPN}_t.inc \
    "

EXTRA_OECMAKE:remove = "-DWITH_TESTS=OFF"
EXTRA_OECMAKE:append = " -DWITH_TESTS=ON -DUSE_BUILD_LIBS=OFF \
    -DTEST_EXECUTABLE_INSTALL_PATH=/opt/tests/${PN}/ \
    -Dgmock_build_tests=ON -Dgtest_build_samples=ON -Dgtest_build_tests=ON \
    -DCMAKE_SKIP_RPATH=ON \
    "

DEPENDS += "gtest gmock"

do_install:append() {
    mkdir -p ${D}/opt/tests/${PN}

    for i in `find ${B}/bin/ -type f -regex '.*[tT]est.*'`; do
      install -m 0755 ${i} ${D}/opt/tests/${PN}
    done
    install -m 0755 ${WORKDIR}/${BPN}_t.inc ${D}/opt/tests/${PN}
}

PACKAGES += " ${PN}-test"

FILES_${PN}-dbg += "/opt/tests/${PN}/.debug/* "
FILES_${PN}-test = "/opt/tests/${PN}/ "
