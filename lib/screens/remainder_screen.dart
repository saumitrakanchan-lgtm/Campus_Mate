import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../services/notification_service.dart';

class RemainderScreen extends StatefulWidget {
  const RemainderScreen({super.key});

  @override
  State<RemainderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<RemainderScreen> {
  final box = Hive.box('reminderBox');

  List assignments = [];

  @override
  void initState() {
    super.initState();
    assignments = box.get('remainders', defaultValue: []);
  }

  void saveData() {
    box.put('assignments', assignments);
  }

  void addAssignment(String title, DateTime dueDate) {
    DateTime reminderDate = DateTime.now().add(const Duration(seconds: 10));

    NotificationService.scheduleNotification(
      assignments.length,
      "Reminder",
      "$title is due tomorrow!",
      reminderDate,
    );

    setState(() {
      assignments.add({"title": title, "date": dueDate.toString()});
    });

    saveData();
  }

  void showAddDialog() {
    TextEditingController controller = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Remainder"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              child: const Text("Select Due Date"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty && selectedDate != null) {
                addAssignment(controller.text, selectedDate!);
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void deleteAssignment(int index) {
    setState(() {
      assignments.removeAt(index);
    });
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remainders")),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: assignments.isEmpty
          ? const Center(child: Text("No remainders"))
          : ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(assignments[index]["title"]),
                    subtitle: Text(
                      assignments[index]["date"].toString().split(' ')[0],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteAssignment(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
