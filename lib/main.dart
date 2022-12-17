import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
Set <Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_pin),
          onPressed: () {
          mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(31.768319, 35.213710),
            zoom: 11.0,)));
        },),
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          markers: markers,
          onTap: ((LatLng x) {
            log(x.toString());
            markers.add(Marker(markerId: MarkerId('jarusalem+${x.latitude}'), position: x)
            );
            setState(() {
              
            });

          }),
          
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.768319, 35.213710),
            zoom: 11.0,
          ),
        
      ),
    ));
  }
}