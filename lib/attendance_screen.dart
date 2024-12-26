import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'member.dart'; // Assuming Member and VisitedLocation are defined here
import 'route_screen.dart';

// Ombre Purple Color Scheme
const Color ombrePurpleStart = Color(0xFF6A1B9A); // Deep Purple
const Color ombrePurpleMid = Color(0xFF8E24AA); // Medium Purple
const Color ombrePurpleEnd = Color(0xFFD81B60); // Pinkish Purple
const Color ombreAccent = Color(0xFFF06292); // Light Purple-Pink Accent
const Color backgroundLight =
Color(0xFFF3E5F5); // Very Light Purple for backgrounds
const Color textLight = Colors.white; // Light text
const Color textDark = Colors.black87; // Dark text

class AttendanceScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Attendance",
            style: TextStyle(
                color: textLight, fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: ombrePurpleStart,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: textLight,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ombrePurpleStart,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.av_timer, // Replace with the desired icon
                        color: textLight,
                        size: 24, // Adjust size as needed
                      ),
                      SizedBox(width: 2),
                      Text(
                        'WayPoint',
                        style: TextStyle(
                          color: textLight,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/images/profile.jpeg'), // Replace with your image path
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Vinove',
                            style: TextStyle(color: textLight, fontSize: 16),
                          ),
                          Text(
                            'vinove@gmail.com',
                            style: TextStyle(color: textLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Timer'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Activity'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer_outlined),
              title: const Text('Timesheet'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.assessment),
              title: const Text('Report'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Jobsite'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Team'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Time off'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Schedules'),
              onTap: () {
                // Handle logout
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.how_to_reg),
              title: const Text('Request to Join Organisation'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('FAQ & Help'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Version: 2.10(2)'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: fakeMembers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All Members" row
            return Container(
              color: Colors.grey[200],
              child: ListTile(
                leading: Icon(
                  Icons.groups,
                ),
                title: Text(
                  "All Members",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllMembersScreen(), // Navigate to All Members screen
                    ),
                  );
                },
              ),
            );
          }
          final member = fakeMembers[index - 1];
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: member.profileImg.image,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${member.name} (${member.id})",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                // Check if the user has checked in
                if (member.checkInTime == null)
                // If no check-in time, display "Not Logged-In Yet"
                  Text(
                    "Not Logged-In Yet",
                    style: TextStyle(color: Colors.grey),
                  )
                else
                  if (member.checkOutTime == null)
                  // If user has checked in but not checked out, display "Working"
                    Row(
                      children: [
                        // Green arrow before checkInTime
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(member.checkInTime ?? "Not Available"),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text("Working", style: TextStyle(color: Colors.orange)),
                      ],
                    )
                  else
                  // If the user has checked in and out, show both times
                    Row(
                      children: [
                        // Green arrow before checkInTime
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(member.checkInTime ?? "Not Available"),

                        const SizedBox(width: 16),
                        // Add spacing between the times

                        // Red arrow before checkOutTime
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(member.checkOutTime ?? "Not Available"),
                      ],
                    ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MemberDetailScreen(member: member),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.gps_fixed,
                      size: 20, color: Colors.purple),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RouteScreen(
                                visitedLocations: member.visitedLocations),
                      ),
                    );
                  },
                ),
              ],
              // ),
            ),
          );
        },
      ),
    );
  }
}

class MemberDetailScreen extends StatefulWidget {
  final Member member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<VisitedLocation> filteredLocations = widget.member.visitedLocations
        .where((location) =>
    location.timestamp.day == selectedDate.day &&
        location.timestamp.month == selectedDate.month &&
        location.timestamp.year == selectedDate.year)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member.name),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: const Text("Select date"),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter:
                LatLng(widget.member.latitude, widget.member.longitude),
                initialZoom: 13.0,
                minZoom: 10.0,
                maxZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                          widget.member.latitude, widget.member.longitude),
                      width: 40.0,
                      height: 40.0,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TimelineView(visitedLocations: filteredLocations),
          ),
        ],
      ),
    );
  }
}

class TimelineView extends StatelessWidget {
  final List<VisitedLocation> visitedLocations;

  const TimelineView({super.key, required this.visitedLocations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visitedLocations.length,
      itemBuilder: (context, index) {
        final location = visitedLocations[index];
        return ListTile(
          title: Text('Location ${index + 1}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time: ${location.timestamp.toString()}'),
              Text('Lat: ${location.latitude}, Lon: ${location.longitude}'),
            ],
          ),
        );
      },
    );
  }
}

class AllMembersScreen extends StatefulWidget {
  @override
  _AllMembersScreenState createState() => _AllMembersScreenState();
}

class _AllMembersScreenState extends State<AllMembersScreen> {
  List<Member> filteredMembers = fakeMembers;
  TextEditingController _searchController = TextEditingController();

  void _filterMembers(String query) {
    setState(() {
      filteredMembers = fakeMembers.where((member) {
        return member.name.toLowerCase().contains(query.toLowerCase()) ||
            member.id.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterMembers(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar Section
          AppBar(
            title: Text(
              "Members",
              style: TextStyle(
                color: textLight,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: ombrePurpleStart, // Set AppBar background to blue
          ),
          // Search Bar Section
          Container(
            color: textLight,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Members',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          // List of Members
          Expanded(
            child: ListView.builder(
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: member.profileImg.image,
                  ),
                  title: Text(member.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


//code B
import 'package:flutter/material.dart';
import 'dart:math';
import 'map_screen.dart';
import 'member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // This map will track the visited locations by user name
  Map<String, List<Map<String, dynamic>>> userVisitedLocations = {
  }; // **Added functionality**

  // Function to get location name using latitude and longitude
  Future<String> _getLocationName(double latitude, double longitude) async {
    // **Added functionality**
    final apiUrl =
        'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json'; // **Added functionality**
    try {
      print('Fetching address for coordinates: ($latitude, $longitude)');
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Received data: $data');
        // Nominatim returns a formatted address, we return the display name
        if (data.containsKey('display_name')) {
          return data['display_name'] ??
              'Unknown Location'; // **Added functionality**
        } else {
          print('No display_name found in data: $data');
        }
      } else {
        print('Failed to fetch location name. Status code: ${response
            .statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return 'Unknown Location'; // Default in case of error
  }

  @override
  void initState() {
    super.initState();
    // Optionally, initialize with some pre-existing locations
    userVisitedLocations = {}; // Starting with an empty map
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: const Color.fromARGB(255, 72, 29, 201),
      ),
      body: ListView.builder(
        itemCount: fakeMembers.length,
        itemBuilder: (context, index) {
          final member = fakeMembers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(member.name[0]),
            ),
            title: Text('${member.name} (${member.id})'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check-in: ${member.checkInTime ?? 'N/A'}'),
                Text('Check-out: ${member.checkOutTime ?? 'N/A'}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today,
                    color: const Color.fromARGB(255, 96, 39, 176)),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.my_location, color: Colors.orange),
                  onPressed: () async {
                    // **Added functionality**
                    // Generate a random new location within a realistic range
                    double randomDistance = 2000 +
                        Random().nextDouble() * 1000; // 2 to 3 km
                    double randomDistanceInDegrees = randomDistance /
                        111000; // 1 degree ≈ 111 km
                    double randomAngle = Random().nextDouble() * 2 * pi;
                    double newLatitude = member.latitude +
                        randomDistanceInDegrees * cos(randomAngle);
                    double newLongitude = member.longitude +
                        randomDistanceInDegrees * sin(randomAngle);

                    // Ensure new coordinates are within valid ranges
                    newLatitude = newLatitude.clamp(-90.0, 90.0);
                    newLongitude = newLongitude.clamp(-180.0, 180.0);

                    // Get the location name using Reverse Geocoding
                    String locationName = await _getLocationName(
                        newLatitude, newLongitude); // **Added functionality**

                    // Check if the member already has a visited locations list
                    if (!userVisitedLocations.containsKey(member.name)) {
                      userVisitedLocations[member.name] = [];
                    }

                    // Add the new location to that member's visited locations list
                    setState(() {
                      userVisitedLocations[member.name]!.add({
                        'latitude': newLatitude,
                        'longitude': newLongitude,
                        'name': locationName, // **Added functionality**
                      });
                    });

                    // Navigate to the MapScreen with the user's specific visited locations
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapScreen(
                              latitude: newLatitude,
                              longitude: newLongitude,
                              name: member.name,
                              visitedLocations: userVisitedLocations[member
                                  .name]!, // **Added functionality**
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
