var osmap;
var sat		= L.tileLayer('https://kartoteket.alslug.dk/proxy.php/leaflet/map/sat/{z}/{y}/{x}', {
			maxZoom: 19,
			attribution: 'Tiles &copy; Esri '//&mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GI$
		});
var streets	= L.tileLayer('https://kartoteket.alslug.dk/proxy.php/leaflet/map/street/{z}/{x}/{y}', {
			maxZoom: 19,
			attribution: '&copy; <a href=\"http:/"."/osm.org/copyright\">OpenStreetMap</a> contributors'
		});
var watercolor	= L.tileLayer('https://kartoteket.alslug.dk/proxy.php/leaflet/map/watercolor/{z}/{x}/{y}', {
			maxZoom: 14//,
			//attribution: 'Tiles &copy; Esri '//&mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GI$
		});
var terrain	= L.tileLayer('https://kartoteket.alslug.dk/proxy.php/leaflet/map/terrain/{z}/{x}/{y}', {
			maxZoom: 14//,
			//attribution: '&copy; <a href=\"http:/"."/osm.org/copyright\">OpenStreetMap</a> contributors'
		});
osmap = L.map('openstreetmap',{
//				measureControl:true,
				fullscreenControl: { pseudoFullscreen: true },
				maxZoom: 13+3+2,
				layers:[streets]
				});
//var fullscreen = L.control.Fullscreen({ pseudoFullscreen: true }).addTo(osmap);
new L.control.scale({ imperial: false }).addTo(osmap);

//osmap.setView([55.05,9.36],7);
var layers = new L.control.layers({
			'Sat': sat,
			'Kort': streets,
			'Vandfarver': watercolor,
			'Terræn': terrain,
			})
			.addTo(osmap);
//      var cluster = L.markerClusterGroup({
//                                      //maxClusterRadius:40,
//                                      disableClusteringAtZoom: 10
//                                      });
var icon_url	= 'https://kartoteket.alslug.dk/proxy.php/leaflet/';
var shadow_url	= 'https://kartoteket.alslug.dk/proxy.php/leaflet/marker-shadow.png';
