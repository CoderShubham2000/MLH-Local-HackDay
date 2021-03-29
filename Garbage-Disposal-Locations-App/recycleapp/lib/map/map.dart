import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyMap extends StatefulWidget {
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController _mycontrol;
  Map<MarkerId, Marker> locations = <MarkerId, Marker>{};
  var categories = ["Plastic", "Paper", "Glass", "Food", "Garbage"];

  
  int control = 0;
  BitmapDescriptor custom;
  void createMarker() async {
    custom = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/rec1.png");
  }

  void initMarker(specify, specifyID) async {
    createMarker();
    final MarkerId markerId = MarkerId(specifyID);
    final Marker marker = Marker(
        markerId: markerId,
        position:
            LatLng(specify['Location'].latitude, specify['Location'].longitude),
        infoWindow: InfoWindow(title: specify['Name']),
        icon: custom);
    setState(() {
      bool check = false;
      if (control == 0) {
        check = true;
      } else {
        if (specify['Category'][categories[control - 1]] == true) {
          check = true;
        }
      }
      if (check) {
        locations[markerId] = marker;
      }
    });
  }

  populateLocations() async {
    FirebaseFirestore.instance.collection('TestMakers').get().then((doc) {
      if (doc.docs.isNotEmpty) {
        for (int i = 0; i < doc.docs.length; i++) {
          initMarker(doc.docs[i].data(), doc.docs[i].id);
        }
      }
    });
  }

  void initState() {
    createMarker();
    populateLocations();
    super.initState();
  }

  run() {
    populateLocations();
    locations.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      height: double.maxFinite,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            child: GoogleMap(
              markers: Set<Marker>.of(locations.values),
              onMapCreated: (GoogleMapController controller) {
                _mycontrol = controller;
                controller.setMapStyle(Utils.mapStyle);
              },
              zoomControlsEnabled: false,

              initialCameraPosition: CameraPosition(
                target: LatLng(40.7831, -73.9712),
                zoom: 12,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (control == 1) {
                        control = 0;
                      } else {
                        control = 1;
                      }
                      run();
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: control == 1 ? Colors.green : Colors.white,
                      border: Border.all(width: 1.0, color: const Color(0xFF009900))
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20
                    ),
                    child: Text(
                      "Plastic", 
                      style: TextStyle(
                        color: control == 1 ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (control == 2) {
                        control = 0;
                      } else {
                        control = 2;
                      }
                      run();
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: control == 2 ? Colors.green : Colors.white,
                      border: Border.all(width: 1.0, color: const Color(0xFF009900))
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20
                    ),
                    child: Text(
                      "Paper", 
                      style: TextStyle(
                          color: control == 2 ? Colors.white : Colors.black,
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (control == 3) {
                        control = 0;
                      } else {
                        control = 3;
                      }
                      run();
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: control == 3 ? Colors.green : Colors.white,
                      border: Border.all(width: 1.0, color: const Color(0xFF009900))
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20
                    ),
                    child: Text(
                      "Glass", 
                      style: TextStyle(
                        color: control == 3 ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (control == 4) {
                        control = 0;
                      } else {
                        control = 4;
                      }
                      run();
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: control == 4 ? Colors.green : Colors.white,
                      border: Border.all(width: 1.0, color: const Color(0xFF009900))
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20
                    ),
                    child: Text(
                      "Food", 
                      style: TextStyle(
                        color: control == 4 ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (control == 5) {
                        control = 0;
                      } else {
                        control = 5;
                      }
                      run();
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: control == 5 ? Colors.green : Colors.white,
                      border: Border.all(width: 1.0, color: const Color(0xFF009900))
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20
                    ),
                    child: Text(
                      "Garbage", 
                      style: TextStyle(
                        color: control == 5 ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#523735"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#c9b2a6"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#dcd2be"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ae9e90"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#93817c"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#a5b076"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#447530"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#fdfcf8"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f8c967"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e9bc62"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e98d58"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#db8555"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#806b63"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8f7d77"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#b9d3c2"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#92998d"
      }
    ]
  }
]
  ''';
}
