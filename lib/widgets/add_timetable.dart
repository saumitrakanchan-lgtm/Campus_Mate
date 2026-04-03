import 'package:flutter/material.dart';

class AddTimetableScreen extends StatefulWidget {
  final Function(Map<String, List<Map<String, String>>>) onSave;

  const AddTimetableScreen({super.key, required this.onSave});

  @override
  State<AddTimetableScreen> createState() => _AddTimetableScreenState();
}

class _AddTimetableScreenState extends State<AddTimetableScreen> {
  final PageController _controller = PageController();

  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];

  int currentIndex = 0;

  Map<String, List<Map<String, String>>> timetable = {
    "Monday": [],
    "Tuesday": [],
    "Wednesday": [],
    "Thursday": [],
    "Friday": [],
  };

  void addLecture(String day) {
    TextEditingController subject = TextEditingController();
    TextEditingController time = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Lecture"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: subject,
              decoration: const InputDecoration(labelText: "Subject"),
            ),
            TextField(
              controller: time,
              decoration: const InputDecoration(labelText: "Time"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (subject.text.isNotEmpty && time.text.isNotEmpty) {
                setState(() {
                  timetable[day]!.add({
                    "subject": subject.text,
                    "time": time.text,
                  });
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void nextPage() {
    if (currentIndex < days.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        currentIndex++;
      });
    } else {
      widget.onSave(timetable);
      Navigator.pop(context);
    }
  }

  Widget buildDayPage(String day) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: timetable[day]!
                  .map(
                    (lecture) => Card(
                      child: ListTile(
                        title: Text(lecture["subject"]!),
                        subtitle: Text(lecture["time"]!),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          ElevatedButton(
            onPressed: () => addLecture(day),
            child: const Text("Add Lecture"),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: nextPage,
            child: Text(
              currentIndex == days.length - 1 ? "Save Timetable" : "Next",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Timetable")),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: days.map((day) => buildDayPage(day)).toList(),
      ),
    );
  }
}
