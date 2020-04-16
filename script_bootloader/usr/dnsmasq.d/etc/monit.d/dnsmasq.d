check program DNSMASQ.D with path "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_enable.service" every 6 cycles
    start program = "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_enable.service"
    stop program = "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_disable.service"
    if status == 1 then alert