PACKAGECONFIG:append = " virtfs"

EXTRA_OECONF += " --audio-drv-list=pa"
EXTRA_OECONF:remove_pn-nativesdk-qemu = "--audio-drv-list=pa"
