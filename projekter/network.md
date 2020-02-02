# Vores netværk
Vores netværks-opsætning er lidt mere kompleks end de fleste hjemme-netvæk.

<div class='img-magnifier-container'>
  <img src="/dot-compiler/dot/projekter/network.dot/image.png" alt="Vores netværk" style="width:100%" id='myimage' />
</div>
<style> 
.img-magnifier-container {
  position: relative;
}

.img-magnifier-glass {
  position: absolute;
  border: 3px solid #000;
  border-radius: 50%;
  cursor: none;
  /*Set the size of the magnifier glass:*/
  width: 100px;
  height: 100px;
}
</style>
<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);

  /* Create magnifier glass: */
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");

  /* Insert magnifier glass: */
  img.parentElement.insertBefore(glass, img);

  /* Set background properties for the magnifier glass: */
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;

  /* Execute a function when someone moves the magnifier glass over the image: */
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);

  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /* Prevent any other actions that may occur when moving over the image */
    e.preventDefault();
    /* Get the cursor's x and y positions: */
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /* Prevent the magnifier glass from being positioned outside the image: */
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /* Set the position of the magnifier glass: */
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /* Display what the magnifier glass "sees": */
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }

  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /* Get the x and y positions of the image: */
    a = img.getBoundingClientRect();
    /* Calculate the cursor's x and y coordinates, relative to the image: */
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /* Consider any page scrolling: */
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
magnify("myimage", 3);

</script>

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

