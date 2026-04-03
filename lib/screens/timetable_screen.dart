import 'package:flutter/material.dart';
import 'package:campusmate/widgets/add_timetable.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  Map<String, List<Map<String, String>>> weeklyTimetable = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timetable")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTimetableScreen(
                onSave: (data) {
                  setState(() {
                    weeklyTimetable = data;
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: weeklyTimetable.isEmpty
          ? const Center(child: Text("No timetable created"))
          : ListView(
              children: weeklyTimetable.keys.map((day) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text(day),
                    children: weeklyTimetable[day]!
                        .map(
                          (lecture) => ListTile(
                            title: Text(lecture["subject"]!),
                            subtitle: Text(lecture["time"]!),
                          ),
                        )
                        .toList(),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
