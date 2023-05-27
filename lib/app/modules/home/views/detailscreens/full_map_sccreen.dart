import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:reasa/app/modules/home/views/detailscreens/map.dart';

class FullScreenMap extends StatelessWidget {
  final LatLng location;

  FullScreenMap({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: MapWidget(
            location: location,
          ),
        ),
      ),
    );
  }
}
