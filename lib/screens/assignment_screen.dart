import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});
  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  List<String> assignments = [];

  void addAssignment(String text) {
    setState(() {
      assignments.add(text);
    });
  }

  void showInputDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add Assignment"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter assignment"),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              addAssignment(controller.text);
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assignments")),
      floatingActionButton: FloatingActionButton(
        onPressed: showInputDialog,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (_, index) {
          return ListTile(title: Text(assignments[index]));
        },
      ),
    );
  }
}
