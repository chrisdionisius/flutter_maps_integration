import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({Key? key}) : super(key: key);

  @override
  State<MyLocationPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyLocationPage> {
  final LatLng _initialcameraposition = const LatLng(20.5937, 90.9629);
  GoogleMapController? _controller;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController cntlr) {
    _controller = cntlr;
    _location.onLocationChanged.listen((l) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
