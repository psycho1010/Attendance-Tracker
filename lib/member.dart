import 'package:flutter/material.dart';

class VisitedLocation {
  final DateTime timestamp;
  final double latitude;
  final double longitude;

  VisitedLocation({
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });
}

class Member {
  final String name;
  final String id;
  final String status;
  final String? checkInTime;
  final String? checkOutTime;
  final double latitude;
  final double longitude;
  final List<VisitedLocation> visitedLocations;
  final Image profileImg;

  Member({
    required this.profileImg,
    required this.name,
    required this.id,
    required this.status,
    this.checkInTime,
    this.checkOutTime,
    required this.latitude,
    required this.longitude,
    required this.visitedLocations,
  });
}

List<Member> fakeMembers = [
  Member(
    profileImg: Image.asset('assets/images/vishesh.jpeg'),
    name: 'Vishesh Tanwar',
    id: 'WSL0003',
    status: 'WORKING',
    checkInTime: '09:30 am',
    latitude: 28.6454444444,
    longitude: 77.1243888889,
    visitedLocations: [
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
        latitude: 28.6454444444,
        longitude: 77.1243888889,
      ),
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        latitude: 28.6423055556,
        longitude: 77.1259444444,
      ),
    ],
  ),
  Member(
    profileImg: Image.asset('assets/images/himanshu.jpeg'),
    name: 'Himanshu Rawat',
    id: 'WSL0034',
    status: 'PRESENT',
    checkInTime: '09:30 am',
    checkOutTime: '06:40 pm',
    latitude: 28.6271944444,
    longitude: 77.1306944444,
    visitedLocations: [
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 3)),
        latitude: 28.6271944444,
        longitude: 77.1306944444,
      ),
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 4)),
        latitude: 28.6243055556,
        longitude: 77.1344444444,
      ),
    ],
  ),
  Member(
    profileImg: Image.asset('assets/images/arun.jpeg'),
    name: 'Arun Williamson',
    id: 'WSL0054',
    status: 'NOT LOGGED-IN YET',
    latitude: 28.6423055556,
    longitude: 77.1259444444,
    visitedLocations: [
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 5)),
        latitude: 28.6423055556,
        longitude: 77.1259444444,
      ),
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 6)),
        latitude: 28.6459444444,
        longitude: 77.1209444444,
      ),
    ],
  ),
  Member(
    profileImg: Image.asset('assets/images/ayush.jpeg'),
    name: 'Ayush Gilberg',
    id: 'WSL0054',
    status: 'NOT LOGGED-IN YET',
    latitude: 28.6728611111,
    longitude: 77.1373611111,
    visitedLocations: [
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 6)),
        latitude: 28.6728611111,
        longitude: 77.1373611111,
      ),
      VisitedLocation(
        timestamp: DateTime.now().subtract(Duration(hours: 7)),
        latitude: 28.6753055556,
        longitude: 77.1389444444,
      ),
    ],
  ),

  // Add more members as necessary...
];
