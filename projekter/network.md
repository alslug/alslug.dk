# Vores netværk
Vores netværks-opsætning er lidt mere kompleks end de fleste hjemme-netvæk.

<a href='/dot-compiler/dot/projekter/network.dot/image.png' target='_blank'>
  <img src="/dot-compiler/dot/projekter/network.dot/image.png" alt="Vores netværk" style="width:100%" id='myimage' />
</a>

* De røde dele er husets netværk.
* De grønne dele er vores eget netværk.

Vi har vores net LAN kørende på 192.168.201.1/24, hvor vores router kører på 192.168.201.1
og vores gamle netboot-server kører indtil videre på 192.168.201.4.

* udover at vi har en WAN-forbindelse til husets netværk, har vi en internet-forbindelse til en mobil bredbåndsforbindelse som backup.
* vores router har 2 LAN interfaces, en wifi-stick og et VLAN på WAN-siden som er samlet i en bridge.
* vi kobler os på udvalgte enheder af husets wifi-enheder via VLAN på WAN-siden, hvor vi kører vores eget wifi-netværk.

Da vi har en del udstyr som sidder på nettet med fast IP vil vi bruge de samme LAN-opsætninger på vores nye setup.

På grund af tidligere problemer med dns-opslag via husets router, benytter vi 4.2.2.2, som er en
af level3.net's offentlige dns-servere, som default dns-resolver.

Det kunne for så vidt lige så godt være 8.8.8.8 fra google eller 1.1.1.1 fra cloudflare.com eller dns-serveren fra din udbyder.

