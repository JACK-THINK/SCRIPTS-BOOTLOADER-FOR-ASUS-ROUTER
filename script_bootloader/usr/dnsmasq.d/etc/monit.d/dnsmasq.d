check directory DNSMASQ.D path "/opt/etc/dnsmasq.d"
    start program = "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_enable.service"
    stop program = "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_disable.service"
    if does not exist then alert
    if changed timestamp then exec "/opt/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_enable.service"