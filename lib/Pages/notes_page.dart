import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Map<String, String>> notes = [];

  String selectedFilter = "All";
  String searchText = "";

  List<String> filters = [
    "All",
    "Interview Prep",
    "Company Research",
    "Technical",
    "Tips & Tricks",
  ];

  List<Map<String, String>> get filteredNotes {
    return notes.where((note) {
      bool matchFilter =
          selectedFilter == "All" || note['category'] == selectedFilter;
      bool matchSearch = note['title']!.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      return matchFilter && matchSearch;
    }).toList();
  }

  void addNote() {
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();
    String category = "Interview Prep";

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0B1120),
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "New Note",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: title,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: content,
                  maxLines: 4,
                  decoration: const InputDecoration(labelText: "Content"),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  value: category,
                  items: filters
                      .where((e) => e != "All")
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => category = v!,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      notes.add({
                        "title": title.text,
                        "content": content.text,
                        "category": category,
                      });
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Save Note"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: addNote,
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notes",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Interview prep & company research",
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 20),

            /// search
            TextField(
              onChanged: (v) => setState(() => searchText = v),
              decoration: InputDecoration(
                hintText: "Search notes...",
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// filters
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (_, i) {
                  final f = filters[i];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(f),
                      selected: selectedFilter == f,
                      onSelected: (_) => setState(() => selectedFilter = f),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// empty
            if (filteredNotes.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        size: 50,
                        color: Colors.white30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "No notes yet — create one!",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ),

            /// notes list
            ...filteredNotes.asMap().entries.map((entry) {
              int index = entry.key;
              var note = entry.value;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFF0B1120),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          note['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => deleteNote(index),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      note['content']!,
                      style: const TextStyle(color: Colors.white60),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.cyan.withOpacity(.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        note['category']!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
