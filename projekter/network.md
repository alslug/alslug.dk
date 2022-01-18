# Vores netværk
Vores netværks-opsætning er lidt mere kompleks end de fleste hjemme-netvæk.

Vi holder styr på hele netværket på Bakkensbro Aktivitets- og Kultur Center, hvor omkring 25 forskellige foreninger holder til.

Netværket er delt op i flere sektorer:

* wifi for brugerne på **bakkensbro** netværket. (Markeret med rødt)
* AlsLUG har eget SSID som er koblet sammen med et større netværk i vores eget lokale. (Markeret med grønt)
* Sundeved Arkiv har deres eget SSID og enkelte kablede enheder koblet op. (Markeret med lilla)
* Husets info-skærme kører i på deres eget netværk. (Markeret med gult)

Alle har adgang til internettet, med ikke adgang til de andre sektorer.

<a href='/image/dot/projekter/network.dot/bakkensbro-network.png' target='_blank'>
  <img src="/image/dot/projekter/network.dot/bakkensbro-network.png" alt="Vores netværk" style="width:100%" id='myimage' />
</a>

* Tykke streger er 1Gbit forbindelser.
* Tynde streger er 100Mbit forbindelser.

Hver sektor kører på deres eget adresse-range.

* udover at vi har en WAN-forbindelse til husets netværk.
* vi kobler os på udvalgte enheder af husets wifi-enheder via VLAN på WAN-siden, hvor vi kører vores eget wifi-netværk.

Da vi har en del udstyr som sidder på nettet med fast IP vil vi bruge de samme LAN-opsætninger på vores nye setup.

På grund af tidligere problemer med dns-opslag via husets router, benytter vi 4.2.2.2, som er en
af level3.net's offentlige dns-servere, som default dns-resolver.

Det kunne for så vidt lige så godt være 8.8.8.8 fra google eller 1.1.1.1 fra cloudflare.com eller dns-serveren fra din udbyder.

