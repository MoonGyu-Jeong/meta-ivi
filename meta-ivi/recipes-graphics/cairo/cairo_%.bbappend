PR = "r1"

# remove this packages because of license
PACKAGES:remove =+ "\
  cairo-perf-utils \
  cairo-script-interpreter \
"

do_install:append () {
	rm -f ${D}${bindir}/cairo-trace
	rm -f ${D}${libdir}/cairo/libcairo-trace.so*

	rmdir ${D}${bindir}
	
	rm -rf ${D}${libdir}/cairo

	rm -f ${D}${libdir}/libcairo-script-interpreter.so*
}
