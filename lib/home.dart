import 'package:flutter/material.dart';
import 'package:next_offer/Pages/landing_page.dart';

import 'Pages/Dashboard_page.dart';
import 'Pages/analytics_page.dart';
import 'Pages/calender_page.dart';
import 'Pages/notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Dashboard(),
    AnalyticsPage(),
    CalendarPage(),
    NotesPage(),
  ];

  final List<String> titles = ["Dashboard", "Analytics", "Calendar", "Notes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      /// APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        elevation: 2,
        titleSpacing: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        // title: Text(titles[selectedIndex]),
        title: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF22D3EE), Color(0xFF8B5CF6)],
                ),
              ),
              child: const Icon(Icons.school, size: 18),
            ),
            const SizedBox(width: 40),
            const Text(
              "PlaceTrack",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ),
        ],
      ),

      /// DRAWER
      drawer: Drawer(
        backgroundColor: const Color(0xFF020617),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              "PlaceTrack",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            drawerItem(Icons.dashboard, "Dashboard", 0),
            drawerItem(Icons.bar_chart, "Analytics", 1),
            drawerItem(Icons.calendar_month, "Calendar", 2),
            drawerItem(Icons.note, "Notes", 3),
          ],
        ),
      ),

      /// BODY SWITCH
      body: pages[selectedIndex],
    );
  }

  Widget drawerItem(IconData icon, String title, int index) {
    bool selected = selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: selected ? Colors.cyan : Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.cyan : Colors.white70,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        setState(() => selectedIndex = index);
        Navigator.pop(context);
      },
    );
  }
}
