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
