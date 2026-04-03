import 'package:flutter/material.dart';
import 'package:campusmate/widgets/add_timetable.dart';
import 'package:campusmate/data/timetable_data.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
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
                    TimetableData.weeklyTimetable = data;
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: TimetableData.weeklyTimetable.isEmpty
          ? const Center(child: Text("No timetable created"))
          : ListView(
              children: TimetableData.weeklyTimetable.keys.map((day) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text(day),
                    children: TimetableData.weeklyTimetable[day]!
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
