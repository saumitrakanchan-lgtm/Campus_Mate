import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Content", style: TextStyle(fontSize: 15)),
            SizedBox(height: 20),
            Text("23-03-2026"),
          ],
        ),
      ),
    );
  }
}
