import 'package:flutter/material.dart';
import 'timetable_screen.dart';
import 'notes_screen.dart';
import 'cgpa_screen.dart';
import 'assignment_screen.dart';
import 'attendance_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget buildCard(BuildContext context, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Center(child: Text(title, style: TextStyle(fontSize: 18))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CampusMate",
          style: TextStyle(color: Colors.white30),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          buildCard(context, "Timetable", const TimetableScreen()),
          buildCard(context, "Notes", const NotesScreen()),
          buildCard(context, "CGPA", const CGPAScreen()),
          buildCard(context, "Assignments", const AssignmentScreen()),
          buildCard(context, "Attendance", const AttendanceScreen()),
        ],
      ),
    );
  }
}
