#!/usr/bin/python

equipos = { '192.168.1.1': 'Mikrotik', '192.168.1.2': 'Server Ubuntu', '192.168.1.3': 'OrdeGordo', '192.168.1.4': 'Telf IP', '192.168.1.5': 'Minix X7', '192.168.1.6': 'AP Wifi', '192.168.1.7': 'Nexus 5', '192.168.1.8': 'Nexus 7' }

import nmap                         # import nmap.py module
nm = nmap.PortScanner()         # instantiate nmap.PortScanner object
nm.scan(hosts='192.168.1.0/24', arguments='-sP')

for host in nm.all_hosts():
	print('Host : %s (%s) %s' % (host, equipos.get(host, "DESCONOCIDO"), nm[host].state()))


