import 'package:campusmate/data/notes_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEntryCard extends StatefulWidget {
  final Function(NotesData) onSave;
  const AddEntryCard({required this.onSave, super.key});
  @override
  State<AddEntryCard> createState() => _AddEntryCard();
}

class _AddEntryCard extends State<AddEntryCard> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _titleEditingController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Content",
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Clear", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    NotesData notes = NotesData(
                      id: '0',
                      title: _titleEditingController.text,
                      content: _contentEditingController.text,
                      date: DateFormat("dd/MM/yyyy").format(DateTime.now()),
                    );
                    // setState(() {
                    //   listOfContent.add(notes);
                    // });
                    widget.onSave(notes);
                    Navigator.pop(context);
                  },
                  child: Text("Save Data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
