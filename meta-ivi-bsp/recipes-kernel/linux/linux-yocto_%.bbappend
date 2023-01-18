# Find defconfig path
FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

# Kernel configs
SRC_URI:append_vexpressa9   = " file://vexpress_a9.cfg"
SRC_URI:append_qemux86      = " file://qemux86.cfg"
SRC_URI:append_qemux86-64   = " file://qemux86_64.cfg"

# vexpress-a9 support
KMACHINE_vexpressa9 = "qemuarma9"
COMPATIBLE_MACHINE_vexpressa9 = "vexpressa9"
KERNEL_DEVICETREE_vexpressa9 = "vexpress-v2p-ca9.dtb"

# no warning message during do_kernel_configcheck
KCONF_AUDIT_LEVEL = "0"
