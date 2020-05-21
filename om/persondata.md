# Hvad bruger vi dine data til?

## Cookies mv når du besøger hjemmesiden.
Du kan se hvad vi bruger [cookies](cookies.md) etc til på [cookies-siden](cookies.md).

## Persondata ifb med medlemskab
Jfr vores vedtægter skal vi kende din e-mail-adresse, når du skal være medlem af AlsLUG.

Men vi vil meget gerne vide lidt mere om dig:

- Din adresse bruger vi til at markere på vores [oversigtskort](/om/kort.html), hvor vi har medlemmer. Markeringen er KUN en grov markering af hvor du bor. Typisk baseret på det sogn du bor i. (Sogneopdelinger er tilpas finkornet til at vi kan se i hvilket område du bor i, men samtidig så grovkornet at du er rimelig anonym)

- Telefon-numre og evt alternative mail-adresser, så bestyrelsen kan kontakte dig i forbindelse med
 arrangementer eller problemløsning.

Medlems-kartoteket er kun tilgængeligt for bestyrelsen.

### Se dine data
Du kan få adgang til hvilke data vi har registreret [her](/medlemskab/indtast_email.html).

Siden er under udvikling.




## Post-lister
Når du er medlem af en eller flere af vore postlister, kan andre ikke se at du er medlem før du selv skriver
eller besvarer en mail.

Hvis du skriver til vore postlister, vil dine mails blive videresendt til de andre medlemmer på listen.

Vi har selvfølgelig ingen mulighed for at slette mails som ligger i din mailbox. Ej heller fra andre medlemmers mailbox.

<div class='strikeout'>
Alle mails som sendes via vore postlister, arkiveres hos gmane.org, som leverer et nntp-interface af alle listens beskeder.

Det er pt ikke mulig af få slettet besked som ligger hos gmane.org, og alle besked ligger offentligt tilgængelige.
</div>

*Undlad derfor at skrive ting som du ikke ønske at andre skal se.*





## Overvågning i vores lokale.
### Billeder
Der tages løbende billeder som kan bruges til PR i forbindelse med annoncer, plancer etc.

Der optages hverken video eller lyd.
<!-- HVOR -->

### Netværket
Når du kobler på vores netværk (Både trådløst og kabel-netværk) registreres din MAC-adresse og tidspunkt.

Dette bruges til statistik af hvor mange besøgende vi har til arrangementer, og statistik på hvor mange nye og returnerende gæster vi har. MAC-adressen vil normalt ikke være registreret med en ejer af enhedem.
<!-- HVOR -->

#### Hvis du han en nøgle-brik til døren
Dine nøgle-informationer gemmes i medlemskartoteket, og ligger som en dobbelt salted hash af dit nøgle-id.

Vi registerer hvem der låser dører op hvornår.





## Hvilke data får vi/gemmer vi når du donerer penge til os?

### Ved donation via bank-overførsel
Vi modtager teksten som du angiver i overførslen. (Typisk "Fra Dit Navn" hvis ikke du angiver andet.

Disse data vil kunne figurere i regnskabet som er offentligt tilgængeligt.





### Ved donation via iZettel kortbetaling i lokalet
Ved betaling via iZettle modtager vi de sidste 4 cifre fra dit betalingskort. Ikke noget navn eller andre data om dig.





### Ved donation i kaffekassen.
Donationer til grisen er i sagens natur 100% anonyme.





<div class='strikeout'>
### Ved donation via MobilePay *(ER BLEVET LUKKET NED OKT 2019)*
Vi modtager dit navn og de sidste 4 cifre i dit telefon-nummer, samt den besked du evt skriver på overførslen.

Disse data vil kunne figurere i regnskabet som er offentligt tilgængeligt.
</div>




## Hvor ligger dine data?
- Hjemmesiden ligger på en VPS hos [Hetzner](https://hetzner.com) i Falkenstein i sydtyskland.
- <div class='strikeout'>Medlemsdatabase ligger på foreningens nextcloud instance hos [oCloud.de](https://ocloud.de) - som også benytter [Hetzner](https://hetzner.com) i Falkenstein.</div>
- Alle oplysningerne ligger i forbindelse med postlisterne kører hos [Mailgun.com](https://mailgun.com), og ligger på deres europæiske site som ligger hos Amazon AWS i region central europa.
- <div class='strikeout'>Postlisterne blev tidligere arkiveres hos GMane ( https://gmane.org virker ikke for øjeblikket ).</div>
- Billeder fra lokalet ligger på vores egen server på Bakkensbro
- Netværksstatistikken ligger på formandens private VPS hos [Linode.com](https://linode.com) i London. Funktionerne herfra flyttes stille og roligt over på foerningens egen/egne server(e) hos [Hetzner](https://hetzner.com) og i vores lokale.





## Test fra privacy kompasset
Vi har brugt PrivacyKompassets test til at kigge på vor GDPR compliance. Testen kan du hente som pdf:
[PrivacyKompasset - testresultat](/PrivacyKompasset_testresultat.pdf).

Vore kommentarer til testen, da den ikke helt passe ind i vores case:

- Spørgsmål 6: Der har ikke tidligere været beskrevet hvad vi bruger medlemsdata (på nær email-adresser) til.
- Spørgsmål 7: Vi skal have checket grundlaget.
- Spørgsmål 9: Vi gør ikke noget aktivt for at opdatere oplysningerne, men hvis vi bliver gjort opmærksomme på forkerte bliver de selvfølgelig rettet.
- Spørgsmål 11: Vi videregiver ikke person-oplysninger til andre.
Hvis et medlem skriver en mail på en mailingliste, bliver de sendte til andre medlemmer. Hvor disse mails havner har vi ingen kontrol over.
- Spørgsmål 19: Hvem skulle det være?
- Spørgsmål 20: Adgang til medlemsdata er kun tilgængeligt via VPN fra specifikke maskiner
- Spørgsmål 21: Ingen udpeget DPO
