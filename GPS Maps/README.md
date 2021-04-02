
A Progressive Web App (PWA) that leverages modern browser technology for viewing custom maps, even when offline.

## Features
- **Simple** - 100% client-side, distributed via the web, hosted free on GitHub Pages
- **Cross Platform** - PWA support across all modern browsers, including iOS Safari and Android Chrome
- **Works Offline** - Service workers used to pre-cache all application assets

## Functionality
- View your GPS position on a custom map without having to pre-build a custom app or website
- Leverage commonly used, freely available basemap services (OpenStreetMap, USGS Topo & Imagery, NOAA Navigation Charts)
- Load custom raster maps (MBTiles) and vector features (GeoJSON, KML, GPX) directly from the device or common cloud storage providers (iCloud, Dropbox, GDrive)

## How It's Built
With simplicity in mind, I wanted to include as few dependencies as possible. Everything is written in vanilla JavaScript, HTML, and CSS, referencing the minified vendor files separately without any build tooling. These are the open source vendor libraries used:

- [Leaflet](https://leafletjs.com/) - open-source JavaScript library for mobile-friendly interactive maps
- [Leaflet.Locate](https://github.com/domoritz/leaflet-locatecontrol) - leaflet control to geolocate the user (plugin)
- [Leaflet.TileLayer.MBTiles](https://gitlab.com/IvanSanchez/Leaflet.TileLayer.MBTiles) - leaflet plugin for loading raster tilesets in MBTiles format
- [SQL.js](https://github.com/kripken/sql.js/) - a port of SQLite to WebAssembly for use in JavaScript (required for reading MBTiles)
- [toGeoJSON](https://github.com/mapbox/togeojson) - helper script for converting KML & GPX to GeoJSON
- [Turf.js](http://turfjs.org/) - modular geospatial engine written in JavaScript (custom build limited to area & length modules)
- [Font Awesome](https://fontawesome.com/) - web font icon set, used for control button icons
