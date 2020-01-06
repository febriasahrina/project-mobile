import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSample extends StatefulWidget {
  @override
  _MapsSampleState createState() => _MapsSampleState();
}

class _MapsSampleState extends State<MapsSample> {

  final Set<Marker> _markers = Set();
  final double _zoom = 20;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(3.590000, 98.678017), zoom: 500.0);
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          centerTitle: true,
          backgroundColor: Color(0XFF558948),
        ),
        drawer: _drawer(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              mapType: _defaultMapType,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
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

  Widget _drawer(){
    return Drawer(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          SizedBox(
                  height: 25.0,
                ),
          ListTile(
            onTap: (){},
            title: new Text("Top 5 Destination"),
          ),
          Divider(),
          ListTile(
            onTap: (){
              _goToNewYork();
              Navigator.of(context).pop();
            },
            title: new Text("Istana Maimun"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToNewDelhi();
              Navigator.of(context).pop();
            },
            title: new Text("Tjong A Fie"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToLondon();
              Navigator.of(context).pop();
            },
            title: new Text("Little India"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToTokyo();
              Navigator.of(context).pop();
            },
            title: new Text("Museum Rahmatsyah"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToDubai();
              Navigator.of(context).pop();
            },
            title: new Text("Graha Velangkanni"),
            trailing: new Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }


  Future<void> _goToNewYork() async {
    //istana maimun
    double lat = 3.575239;
    double long = 98.683871;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('istana maimun'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Istana Maimun', snippet: 'Lets Travelling in Istana Maimun')
        ),
      );
    });
  }

  //tjong a fie
  Future<void> _goToNewDelhi() async {
    double lat = 3.585570;
    double long = 98.680619;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('tjong a fie'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'T Jong A Fie',  snippet: 'Lets Travelling in T Jong A Fie')),
      );
    });
  }

  //kampung madras
  Future<void> _goToLondon() async {
    double lat = 3.583891;
    double long = 98.670289;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('kampung madras'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Kampung Madras',  snippet: 'Lets Travelling in Kampung Madras')),
      );
    });
  }

  //museum rahmatsyah
  Future<void> _goToTokyo() async {
    double lat = 3.579256;
    double long = 98.667734;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('museum rahmatsyah'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Museum Rahmatsyah',  snippet: 'Lets Travelling in Museum Rahmatsyah')),
      );
    });
  }

  //graha maria annai velangkanni
  Future<void> _goToDubai() async {
    double lat = 3.548021;
    double long = 98.608744;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('velangkanni'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Velangkanni',  snippet: 'Lets Travelling in Velangkanni')),
      );
    });
  }
}
