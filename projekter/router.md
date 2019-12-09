# Opsætning af linux-router fra bunden

## Basis maskine
Vores nye router/server er en "tilfældig" doneret pc. I vores tilfælde har den god plads til en masse harddisks, da den senere skal udvides til at bruges som netboot-server, hvilket kræver en masse disk-plads.

Maskinen er blevet installeret med en standard 18.04 ubuntu-server. Eller rettere via et ubuntu-mini
image serveret fra vores gamle boot-server.

Resten bliver manuelt bliver lagt ovenpå.


## Netplan: Opsætning af dit network-layout


### Generel opsætning
Du har som udgangspunkt brug for to ethernet-interfaces. Et til WAN (forbindelsen til verden udenfor) og et til LAN (som er det lokale net)


### Vores opsætning
Vi har et lidt mere (komplekst setup)[network.md], Se mere (her)[network.md]. Men det har grundlæggende ikke så meget med opsætningen af routeren at gøre, når selve netværket på forhånd er sat korrekt op.

Vores LAN-side er 192.168.201.1/24, og WAN-adresse(r) henter vi DHCP


## DHCP-server
Først er der brug for en DHCP-server, så den skal installeres:

~~~
sudo apt-get install isc-dhcp-server
~~~

... og konfigureres:

~~~
sudo nano /etc/dhcp/dhcpd.conf
~~~

Vors konfiguration er følgende:
Husk at ændre adresserne på LAN-netværket og DNS til dine opsætninger.

~~~
ddns-update-style none;
option domain-name "lokale.alslug.dk";
option domain-name-servers 127.0.1.1;
default-lease-time 600;
max-lease-time 7200;
log-facility local7;
subnet 192.168.201.0 netmask 255.255.255.0 {
        range 192.168.201.2 192.168.201.254;
        option routers 192.168.201.1;
        option subnet-mask 255.255.255.0;
        option broadcast-address 192.168.201.255;
        option domain-name-servers 4.2.2.2;

        filename "pxelinux.0";
        next-server 192.168.201.4;
}
~~~

DHCP-serveren startes med:

~~~
sudo invoke-rc.d isc-dhcp-server start
~~~

hhv status af serveren:

~~~
sudo invoke-rc.d isc-dhcp-server status
~~~


## IPTABLES

### Opsætning af routing:
For at aktivere routen, så pakker kan flyde mellem de to sider af routen skal routing aktivrres:

~~~
sudo nano /etc/sysctl.conf
~~~

Omkring linie 28 finde du denne linie:

~~~
#net.ipv4.ip_forward=1
~~~

Den ændres til:

~~~
net.ipv4.ip_forward=1 
~~~

One-liner:
~~~
sudo sed "s/#net\.ipv4\.ip_forward=1/net\.ipv4\.ip_forward=1/" -i /etc/sysctl.conf
~~~

### Opsætning af NAT:
Derefter følger opsætning af NAT:

~~~
sudo nano /etc/rc.local
~~~

Tilføjes følgende i slutningen af filen:

~~~
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables --table nat -A POSTROUTING -o eth0 -j MASQUERADE
~~~

~~~
sudo systemctl start rc-local.service
~~~

## Tillykke! Du burde nu have fået liv i en NAT-router
