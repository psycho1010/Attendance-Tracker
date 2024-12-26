import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'member.dart'; // Assuming Member and VisitedLocation are defined here
import 'route_screen.dart';

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
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 72, 29, 201),
        leading: IconButton(
          icon: const Icon(Icons.menu),
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
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.av_timer, // Replace with the desired icon
                        color: Colors.white,
                        size: 24, // Adjust size as needed
                      ),
                      SizedBox(width: 2),
                      Text(
                        'workstatus',
                        style: TextStyle(
                          color: Colors.white,
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
                            'Vinove Software & Services',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'v&s@gmail.com',
                            style: TextStyle(color: Colors.white70),
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
                else if (member.checkOutTime == null)
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
                        builder: (context) => RouteScreen(
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
      appBar: AppBar(
        title: Text("Members"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Members',
                prefixIcon: Icon(Icons.search),
                // Curved corners for the search bar
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMembers.length,
        itemBuilder: (context, index) {
          final member = filteredMembers[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: member.profileImg.image,
            ),
            title: Row(
              children: [
                Text("${member.name}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
