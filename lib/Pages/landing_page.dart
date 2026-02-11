import 'package:flutter/material.dart';
import 'package:next_offer/Pages/login_page.dart';

void main() {
  runApp(const PlaceTrackApp());
}

class PlaceTrackApp extends StatelessWidget {
  const PlaceTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlaceTrack',
      theme: ThemeData.dark(),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        elevation: 5,
        titleSpacing: 16,

        /// Left side logo + name
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF38BDF8), Color(0xFF8B5CF6)],
                ),
              ),
              child: const Icon(Icons.school, size: 18, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text(
              "PlaceTrack",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

        /// Right side icon
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.login, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF020617), Color(0xFF0A0F2C), Color(0xFF121B3A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),

                  /// Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.tealAccent),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.tealAccent,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Your Placement Companion",
                          style: TextStyle(color: Colors.tealAccent),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Title
                  const Text(
                    "Crush Your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFF22D3EE), Color(0xFFA855F7)],
                    ).createShader(bounds),
                    child: const Text(
                      "Career Goals",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// Subtitle
                  const Text(
                    "Stop juggling spreadsheets, WhatsApp screenshots, and sticky notes. One powerful dashboard to track every opportunity, nail every deadline, and land the offer you deserve.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// Start Tracking Button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2DD4BF), Color(0xFF3B82F6)],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Start Tracking  →",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// Secondary button
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Center(
                      child: Text(
                        "See Features",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      StatItem(title: "10K+", subtitle: "Students Tracking"),
                      StatItem(title: "500+", subtitle: "Companies Listed"),
                      StatItem(title: "98%", subtitle: "Deadline Hit Rate"),
                    ],
                  ),

                  const SizedBox(height: 80),
                  const Text("Scroll", style: TextStyle(color: Colors.white38)),
                  const SizedBox(height: 200),
                  const Text(
                    "FEATURES",
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      letterSpacing: 2,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// title
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Everything you need to ",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "succeed",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// subtitle
                  const Text(
                    "Built by students, for students. Every feature designed to reduce placement stress.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60, height: 1.5),
                  ),

                  const SizedBox(height: 35),

                  /// cards
                  featureCard(
                    icon: Icons.track_changes,
                    title: "Track Every Opportunity",
                    desc:
                        "Never miss a deadline again. See all companies, roles, and deadlines in one place.",
                    colors: [Color(0xFF22D3EE), Color(0xFF3B82F6)],
                  ),
                  const SizedBox(height: 18),

                  featureCard(
                    icon: Icons.bar_chart,
                    title: "Visual Progress",
                    desc:
                        "Monitor your application pipeline from wishlist to offer with beautiful status tracking.",
                    colors: [Color(0xFF8B5CF6), Color(0xFF22D3EE)],
                  ),
                  const SizedBox(height: 18),

                  featureCard(
                    icon: Icons.event,
                    title: "Smart Deadlines",
                    desc:
                        "Urgency-based alerts so you always know what needs attention right now.",
                    colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
                  ),
                  const SizedBox(height: 18),

                  featureCard(
                    icon: Icons.check_circle_outline,
                    title: "Prep Checklists",
                    desc:
                        "Attach preparation tasks to each opportunity. Stay organized, stay prepared.",
                    colors: [Color(0xFF34D399), Color(0xFF10B981)],
                  ),
                  const SizedBox(height: 200),

                  /// COMMAND CENTER CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0B1120), Color(0xFF020617)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        /// title
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Your ",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "Command Center",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyanAccent,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "A beautiful dashboard that shows everything at a glance",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white60),
                        ),

                        const SizedBox(height: 25),

                        /// try now button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2DD4BF), Color(0xFF3B82F6)],
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Try it now",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),

                  /// BIG CTA TEXT
                  const Text(
                    "Your future is",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFA855F7), Color(0xFF22D3EE)],
                    ).createShader(bounds),
                    child: const Text(
                      "one click away",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Join thousands of students who stopped missing deadlines and started landing offers.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60, height: 1.5),
                  ),

                  const SizedBox(height: 25),

                  /// GET STARTED BUTTON
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFF2DD4BF)],
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Get Started Free",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.auto_awesome, size: 18),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),

                  /// FOOTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(
                            Icons.school,
                            color: Colors.cyanAccent,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "PlaceTrack",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Built with 💚 for students",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget featureCard({
  required IconData icon,
  required String title,
  required String desc,
  required List<Color> colors,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.white10),
      gradient: const LinearGradient(
        colors: [Color(0xFF0B1120), Color(0xFF0B1120)],
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// icon box
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: colors),
          ),
          child: Icon(icon, color: Colors.white),
        ),

        const SizedBox(width: 16),

        /// text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: const TextStyle(color: Colors.white60, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }
}
