import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tjongafie extends StatefulWidget {
  @override
  _Tjongafie createState() => _Tjongafie();
}

class _Tjongafie extends State<Tjongafie> {
  Set<Marker> markers = Set();
  // Set<Marker>.of(markers);
  
  // final double _zoom = 20;
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(3.585570, 98.680619), zoom: 20.0);
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  updateMarkers()
  {
    setState(()
    {
      markers.clear();
      markers.add(
        Marker(
            markerId: MarkerId('tjong a fie'),
            position: LatLng(3.585570, 98.680619),
            infoWindow: InfoWindow(title: 'T Jong A Fie',  snippet: 'Lets Travelling in T Jong A Fie')
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Tjong A Fie'),
        centerTitle: true,
        backgroundColor: Color(0XFF558948),
      ),
      // drawer: _drawer(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: markers,
            mapType: _defaultMapType,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
          ),
          // _tandalokasi();
          Container(
            margin: EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: Color(0XFF558948),
                    onPressed: () {
                      _changeMapType();
                      print('Changing the Map Type');
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
