import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../src/locations.dart' as locations;

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final Map<String, Marker> _markers = {};

  final Location _location = Location();

  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      _location.onLocationChanged.listen((l) {
        _markers['Current Location'] = Marker(
          markerId: const MarkerId('Current Location'),
          position: LatLng(l.latitude!, l.longitude!),
          infoWindow: const InfoWindow(
            title: 'Current Location',
          ),
        );
      });
    });

    // for (final office in googleOffices.offices) {
    //   final marker = Marker(
    //     markerId: MarkerId(office.name),
    //     position: LatLng(office.lat, office.lng),
    //     infoWindow: InfoWindow(
    //       title: office.name,
    //       snippet: office.address,
    //     ),
    //   );
    //   _markers[office.name] = marker;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
