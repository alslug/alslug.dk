# Netboot fix
På grund af en fejl i ubuntu-installeren, har maskiner som installeres via vores netboot-server i vores lokale en
fejlopsætning af det kablede netværk

Nedenstående kommandoer (teksten med orange baggrund) køres i en (terminal)[/faq/terminal.md]
(Ctrl-Alt-T virker som regel på Ubuntu-varianer m.fl.). Eller kig på siden om (terminal)[/faq/terminal.md]</p>

Hvis computeren stadigvæk kører live-versionen køres denne kommando:

~~~~~
sudo nano /target/etc/network/interfaces
~~~~~

Hvis computeren <b>er</b> blevet genstartet efter installationen køres denne kommando:

~~~~~
sudo nano /etc/network/interfaces
~~~~~

Filen vil ligne denne efter installationen:

~~~~~
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
xxxxxxxxxxxxx
xxxxxxxxxxxxx
~~~~~

De to sidste linier skal slettes, så den indeholder.

~~~~~
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
~~~~~

Derefter genstartes maskinen, og der vil være adgang til internettet.
