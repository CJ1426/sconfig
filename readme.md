this is readme
doas setup /etc/doas.conf
    permit persist :wheel

# SSL apache 
```bash
openssl req -new -x509 -nodes -days 365 -newkey rsa:4096 -keyout file.key -out cert.crt
```

change owner and group to www-data 

edit default-ssl.conf in /etc/apache2/site-available

edit SSLCert file and SSLKey location

enable that site

```bash
a2ensite default-ssl.conf
```

enable module for it to work

```bash
a2enmod ssl headers
```
restart apache2 and you done

# debian dhcp interface
edit /etc/network/interfaces
```
auto <interface name>
iface <interface name> inet dhcp
```

# debian static ip
edit /etc/network/interfaces
```
auto <interface name>
iface <interface name> inet static
  address <your.ip.for.interface>
  netmask <your.netmask.for.interface>
  gateway <your.default.gate.way>
```

# debian as router with ipconfig
edit /etc/sysctl.conf
```
net.ipv4.ip_forward=1
```
enable it with
```bash
sysctl -p
```
setup wan interface with dhcp
setup lan interface with static ip

allow iptables net forwarder rule
```bash
iptables -t nat -A POSTROUTING -o <wan interface name> -j MASQUERADE
iptables -A FORWARD -i <wan interface name> -o <lan interface name> -j ACCEPT
iptables -A FORWARD -i <lan interface name> -o <wan interface name> -j ACCEPT
```
save iptables rule and install **iptables-persistant**
```bash
iptables-save > /etc/iptables/rules.v4
```

install **isc-dhcp-server** and config it
edit /etc/dhcp/dhcpd.conf
```
subnet <your.lan.network.ip> netmask <your.lan.sub.netmask> {
	range <first.ip.for.dhcp> <last.ip.for.dhcp>;
	option routers <your.lan.interface.ip>;
	option domain-name-servers <domain.name.server.ip>;
}
```
edit /etc/default/isc-dhcp-server
```
INTERFACEv4="<your lan interface name>"
```
and finally start that service
```bash
systemctl restart isc-dhcp-server
```
WOW!! IT WORK!!!!!
