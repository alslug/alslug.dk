# Ny-installation af info-skærme

Maskinerne på skærmene er desværre kun 32bit, med meget lidt RAM, så de kan ikke mere trække en Mate, og supporten stoppede reelt i 2020, så opsætningen er lidt outdated.

Derfor er det langt over tid til at få dem re-installeret.

Opsætningen er krafigt inspireret af [denne guide](https://www.willhaley.com/blog/debian-fullscreen-gui-kiosk/).

## Operativsystem

Der bliver lagt en standard Debian 12 på dem, udelukkende med en SSH-server, for at holde installationen til et absolut minimum.

## Installation af programmer

Der installeres grakisk overflade:

>  apt-get install sudo xorg openbox lightdm

## Opsætning af grafisk desktop

lightdm skal konfigureres til automatisk at logge ind på display-brugeren

> nano /etc/lightdm/lightdm.conf

skal have tilføjet følgende linier:

> [SeatDefaults]\
> autologin-user=display\
> user-session=openbox

## Skift til diplay-brugeren

Der oprettes en separat bruger hvor display-funktione kører under:

>  useradd -m display

Der skiftes til display-brugeren:

> su sudo -u display -i

## Opsætning af ssh-nøgler til brug op mod central server

For at kunne lave en ssh-forbindelse til den centrale server skal der laves ssh-nøgler.

> ssh-keygen

Brug standard-filnavnet, og tryk enter ved passphrase ( ellers skal den indtastes ved hver login-forsøg, og det er jo ikke just optimalt når det skal ske automatisk )

Indholdet i /home/display/.ssh/id_rsa.pub skal kopieres til serveren, hvor nøglen skal bruge for at kunne logge ind. ( Se længere nede )


## Opsætning af automatisk start af programmer

Der skal oprettes en mappe til konfig af OpenBox

> mkdir -p ~display/.config/openbox

Der skal oprettes et autostart-script, som køres når maskinen startes op / logges på.

> nano $HOME/.config/openbox/autostart

Autostart indeholder følgende:

> while true ; do\
>     xrandr -o right\
>     xset -dpms\
>     xset s off\
>     ssh -o StrictHostKeyChecking=no -X &lt;bruger&gt;@&lt;host&gt;\
>     sleep 30\

Flere eksempler:

> xterm /bin/bash &

Det er meget vigtigt at hver "komando" afslyttes med "&".

Der kan både bruges enkelte kommandoer som i linien der åbner en xterm,
og mere komplicerede one-liners eller more-liners som i blokken der gentagende vil forsøge at åbne en ssh-forbindelse til infoscreen-serveren.

Kun fantasien sætter grænsen for mulighederne

I vores tilfælde startes en loop som i princippet blever ved med at gøre i al evighed.

Linien med "xrandr" drejer skærmen da vore skærme sidder på løjkant.

Linierne med "xset -dpms" og "xset s off" slår pauseskærmen fra

Linien med "ssh" kobler op til vores centrale server hvor selve applicationerne kører. Hvad der rent faktisk bliver kørt afhænger 100% af konfiguratioen af serveren.

