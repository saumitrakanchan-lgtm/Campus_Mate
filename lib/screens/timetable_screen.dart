import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timetable')),
      body: ListView(
        children: [
          ListTile(title: Text("Math - 9 AM")),
          ListTile(title: Text("Physics - 11 AM")),
        ],
      ),
    );
  }
}
