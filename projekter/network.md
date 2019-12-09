# Vores netværk
Vores netværks-opsætning er lidt mere kompleks end de fleste hjemmenetvæk, da vores router har 2 LAN interfaces, og et VLAN på WAN-siden som er samlet i en bridge.
Desuden at vi har en WAN-forbindelse til husets netværk, har vi en internet-forbindelse til en mobil bredbåndsforbindelse som backup.

Vi kobler os på udvalgte enheder af husets wifi-enheder, hvor vi kører vores eget wifi-netværk.

Vi har vores net LAN kørende på 192.168.201.1/24, hvor vores router kører på 192.168.201.1
og vores gamle netboot-server kører indtil videre på 192.168.201.4.

Da vi har en del udstyr som sidder på nettet med fast IP vil vi bruge de samme LAN-opsætninger på vores nye setup.

På grund af tidligere problemer med dns-opslag via husets router, benytter vi 4.2.2.2, som er en
af level3.net's offentlige dns-servere, som default dns-resolver.

Det kunne for så vidt lige så godt være 8.8.8.8 fra google eller 1.1.1.1 fra cloudflare.com eller dns-serveren fra din udbyder.

