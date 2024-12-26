import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'member.dart';

class RouteScreen extends StatelessWidget {
  final List<VisitedLocation> visitedLocations;

  const RouteScreen({super.key, required this.visitedLocations});

  @override
  Widget build(BuildContext context) {
    List<LatLng> routePoints = visitedLocations
        .map((location) => LatLng(location.latitude, location.longitude))
        .toList();

    List<Marker> stopMarkers = [];
    for (int i = 0; i < visitedLocations.length - 1; i++) {
      if (visitedLocations[i + 1]
              .timestamp
              .difference(visitedLocations[i].timestamp)
              .inMinutes >
          10) {
        stopMarkers.add(
          Marker(
            point: LatLng(
                visitedLocations[i].latitude, visitedLocations[i].longitude),
            width: 40.0,
            height: 40.0,
            child: const Icon(
              Icons.stop,
              color: Colors.red,
              size: 40,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route with Stops'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(visitedLocations.first.latitude,
              visitedLocations.first.longitude),
          initialZoom: 13.0,
          minZoom: 10.0,
          maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
          MarkerLayer(
            markers: stopMarkers,
          ),
        ],
      ),
    );
  }
}
