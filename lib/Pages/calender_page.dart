import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();

  /// events map
  Map<DateTime, List<Map<String, dynamic>>> events = {
    DateTime(2026, 2, 13): [
      {"title": "Google Interview", "type": "interview"},
    ],
    DateTime(2026, 2, 17): [
      {"title": "Amazon Deadline", "type": "deadline"},
    ],
    DateTime(2026, 2, 24): [
      {"title": "Offer Received 🎉", "type": "offer"},
    ],
  };

  List<Map<String, dynamic>> getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  Color getColor(String type) {
    switch (type) {
      case "deadline":
        return Colors.orange;
      case "interview":
        return Colors.cyan;
      case "offer":
        return Colors.green;
      case "test":
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }

  void addEvent() {
    TextEditingController title = TextEditingController();
    String type = "deadline";

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0B1120),
          title: const Text("Add Event"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: "Event title"),
              ),
              DropdownButtonFormField(
                value: type,
                items: const [
                  DropdownMenuItem(value: "deadline", child: Text("Deadline")),
                  DropdownMenuItem(
                    value: "interview",
                    child: Text("Interview"),
                  ),
                  DropdownMenuItem(value: "test", child: Text("Test")),
                  DropdownMenuItem(value: "offer", child: Text("Offer")),
                ],
                onChanged: (v) {
                  type = v!;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  DateTime key = DateTime(
                    selectedDay.year,
                    selectedDay.month,
                    selectedDay.day,
                  );

                  if (events[key] == null) {
                    events[key] = [];
                  }
                  events[key]!.add({"title": title.text, "type": type});
                });

                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: addEvent,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Calendar",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Deadlines and interviews at a glance",
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 20),

            /// CALENDAR CARD
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B1120), Color(0xFF020617)],
                ),
                border: Border.all(color: Colors.white10),
              ),
              child: TableCalendar(
                focusedDay: today,
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    today = focused;
                  });
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                eventLoader: getEventsForDay,
              ),
            ),

            const SizedBox(height: 20),

            /// EVENTS LIST
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B1120), Color(0xFF020617)],
                ),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Events",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  ...getEventsForDay(selectedDay).map(
                    (e) => ListTile(
                      leading: CircleAvatar(
                        radius: 6,
                        backgroundColor: getColor(e['type']),
                      ),
                      title: Text(e['title']),
                      subtitle: Text(e['type']),
                    ),
                  ),
                  if (getEventsForDay(selectedDay).isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "No events for this day",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
