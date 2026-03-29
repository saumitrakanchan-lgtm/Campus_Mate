import 'package:campusmate/data/notes_content.dart';
import 'package:campusmate/widgets/add_card.dart';
import 'package:campusmate/widgets/notes_card.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  State<NotesScreen> createState() => _NotesScreen();
}

class _NotesScreen extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: const Color.fromARGB(31, 54, 47, 47),
      ),
      body: ListView.builder(
        itemCount: listOfContent.length,
        itemBuilder: (context, index) {
          return NotesCard(notes: listOfContent[index]);
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
              return AddEntryCard(
                onSave: (notes) {
                  listOfContent.add(notes);
                },
              );
            },
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
