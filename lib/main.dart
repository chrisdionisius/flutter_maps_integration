import 'package:flutter/material.dart';
import 'package:flutter_maps_integration/pages/current_location.dart';
import 'package:flutter_maps_integration/pages/maps_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapsWidget(),
    );
  }
}