import 'package:campusmate/widgets/add_Card.dart';
import 'package:campusmate/widgets/notes_card.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: const Color.fromARGB(31, 54, 47, 47),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const NotesCard();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return AddEntryCard();
            },
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
