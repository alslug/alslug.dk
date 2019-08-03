var osmap;
var sat		= L.tileLayer('https://kartoteket.alslug.dk/.images/proxy.php/map/sat/{z}/{y}/{x}', {
			maxZoom: 19,
			attribution: 'Tiles &copy; Esri '//&mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GI$
		});
var streets	= L.tileLayer('https://kartoteket.alslug.dk/.images/proxy.php/map/street/{z}/{x}/{y}', {
			maxZoom: 19,
			attribution: '&copy; <a href=\"http:/"."/osm.org/copyright\">OpenStreetMap</a> contributors'
		});
osmap = L.map('openstreetmap',{
				maxZoom: 13+3,
				layers:[streets]
				});
new L.control.layers({
			'Sat': sat,
			'Kort': streets
			})
			.addTo(osmap);
//      var cluster = L.markerClusterGroup({
//                                      //maxClusterRadius:40,
//                                      disableClusteringAtZoom: 10
//                                      });
var icon_url	= 'https://kartoteket.alslug.dk/proxy.php/leaflet/';
var shadow_url	= 'https://kartoteket.alslug.dk/proxy.php/leaflet/marker-shadow.png';
