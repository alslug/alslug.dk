# Opsætning af linux-router fra bunden

## Basis maskine
Vores nye server er en "tilfældig" doneret pc som har god plads til en masse harddisks.
Den er blevet installeret med en standard 18.04 ubuntu-server. Eller rettere via et ubuntu-mini
image serveret fra vores gamle boot-server, hvorpå resten manuelt bliver lagt ovenpå.
## Netplan: Opsætning af dit network-layout
Vi har vores net LAN kørende på 192.168.201.1/24, hvor vores router kører på 192.168.201.1
og vores gamle netboot-server kører indtil videre på 192.168.201.4.

Da vi har en del udstyr som sidder på nettet med fast IP vil vi bruge de samme LAN-opsætninger på vores nye setup.

På grund af tidligere problemer med dns-opslag via husets router, benytter vi 4.2.2.2, som er en
af level3.net's offentlige dns-servere, som default dns-resolver.

Det kunne for så vidt lige så godt være 8.8.8.8 fra google eller 1.1.1.1 fra cloudflare.com.


## DHCP-server

~~~
sudo apt-get install isc-dhcp-server
~~~

~~~
sudo nano /etc/dhcp/dhcpd.conf
~~~

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

~~~
sudo invoke-rc.d isc-dhcp-server status
~~~

## IPTABLES

### Opsætning af routing:

~~~
sudo nano /etc/sysctl.conf
~~~

Omkring linie 28 finde du denne linie:

~~~
#net.ipv4.ip_forward=1
~~~

Den ændres til:

~~~
net.ipv4.ip_forward=1 </pre>
~~~

<div class='one-liner'>

~~~
sudo sed "s/#net\.ipv4\.ip_forward=1/net\.ipv4\.ip_forward=1/" -i /etc/sysctl.conf</pre>
~~~

</div>

### Opsætning af NAT:

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
