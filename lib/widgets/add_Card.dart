import 'package:flutter/material.dart';

class AddEntryCard extends StatefulWidget {
  const AddEntryCard({super.key});
  @override
  State<AddEntryCard> createState() => _AddEntryCard();
}

class _AddEntryCard extends State<AddEntryCard> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  void _printData() {
    print(_titleEditingController.text);
    print(_contentEditingController.text);
  }

  @override
  Widget build(BuildContext vontext) {
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
                  onPressed: () {},
                  child: Text("Clear", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {},
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
