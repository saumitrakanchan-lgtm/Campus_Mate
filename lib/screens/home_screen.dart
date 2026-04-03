// import 'package:campusmate/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'timetable_screen.dart';
import 'notes_screen.dart';
import 'cgpa_screen.dart';
import 'attendance_screen.dart';
import 'remainder_screen.dart';

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
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CampusMate", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          buildCard(context, "Notes", const NotesScreen()),
          buildCard(context, "Timetable", const TimetableScreen()),
          buildCard(context, "Attendance", const AttendanceScreen()),
          buildCard(context, "CGPA", const CGPAScreen()),
          buildCard(context, "Reminders", const RemainderScreen()),
          // ElevatedButton(
          //   onPressed: () async {
          //     await NotificationService.showInstantNotification(
          //       1,
          //       "Test",
          //       "Instant notification working",
          //     );
          //   },
          //   child: Text("Test Now"),
          // ),
        ],
      ),
    );
  }
}
