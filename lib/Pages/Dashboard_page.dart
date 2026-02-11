import 'package:flutter/material.dart';

void main() {
  runApp(const PlaceTrack());
}

class PlaceTrack extends StatelessWidget {
  const PlaceTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF020617)),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// top bar
                const SizedBox(height: 25),

                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Track your placement journey",
                  style: TextStyle(color: Colors.white60),
                ),

                const SizedBox(height: 20),

                /// stats grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    StatCard("5", "Total Opportunities", Colors.cyan),
                    StatCard("4", "Upcoming Deadlines", Colors.orange),
                    StatCard("1", "Offers Received", Colors.green),
                    StatCard("2", "In Progress", Colors.purple),
                  ],
                ),

                const SizedBox(height: 25),

                /// upcoming deadlines
                sectionCard(
                  "Upcoming Deadlines",
                  Column(
                    children: const [
                      DeadlineTile("Google", "Software Engineer", "3 days"),
                      Divider(color: Colors.white10),
                      DeadlineTile("Microsoft", "Product Manager", "7 days"),
                      Divider(color: Colors.white10),
                      DeadlineTile("Amazon", "SDE Intern", "14 days"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// status overview
                sectionCard(
                  "Status Overview",
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.white10,
                        color: Colors.cyan,
                        minHeight: 8,
                      ),
                      const SizedBox(height: 15),
                      statusRow("Wishlist", 2, Colors.blue),
                      statusRow("Applied", 1, Colors.orange),
                      statusRow("Interview", 1, Colors.cyan),
                      statusRow("Selected", 1, Colors.green),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// search
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search companies or roles...",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// filter chips
                Wrap(
                  spacing: 8,
                  children: const [
                    FilterChipUI("All", true),
                    FilterChipUI("Wishlist", false),
                    FilterChipUI("Applied", false),
                    FilterChipUI("Interview", false),
                    FilterChipUI("Selected", false),
                  ],
                ),

                const SizedBox(height: 15),

                /// add button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                ),

                const SizedBox(height: 20),

                /// company cards
                const CompanyCard(
                  "Google",
                  "Software Engineer",
                  "₹45 LPA",
                  "Interview",
                  0.7,
                ),
                const SizedBox(height: 12),
                const CompanyCard(
                  "Microsoft",
                  "Product Manager",
                  "₹38 LPA",
                  "Applied",
                  0.2,
                ),
                const SizedBox(height: 12),
                const CompanyCard(
                  "Amazon",
                  "SDE Intern",
                  "₹1.2L/month",
                  "Wishlist",
                  0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget sectionCard(String title, Widget child) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0B1120),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  static Widget statusRow(String name, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(radius: 5, backgroundColor: color),
          const SizedBox(width: 10),
          Expanded(child: Text(name)),
          Text("$count"),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String title;
  final Color color;

  const StatCard(this.number, this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0B1120),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, color: color),
          const Spacer(),
          Text(
            number,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class DeadlineTile extends StatelessWidget {
  final String company;
  final String role;
  final String days;

  const DeadlineTile(this.company, this.role, this.days, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius: 4, backgroundColor: Colors.orange),
      title: Text(company, style: const TextStyle(color: Colors.white)),
      subtitle: Text(role, style: const TextStyle(color: Colors.white60)),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(days),
      ),
    );
  }
}

class FilterChipUI extends StatelessWidget {
  final String text;
  final bool selected;

  const FilterChipUI(this.text, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: selected ? Colors.cyan : Colors.white10,
    );
  }
}

class CompanyCard extends StatelessWidget {
  final String company;
  final String role;
  final String package;
  final String status;
  final double progress;

  const CompanyCard(
    this.company,
    this.role,
    this.package,
    this.status,
    this.progress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xFF0B1120),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                company,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(package, style: const TextStyle(color: Colors.cyan)),
            ],
          ),
          Text(role, style: const TextStyle(color: Colors.white60)),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
