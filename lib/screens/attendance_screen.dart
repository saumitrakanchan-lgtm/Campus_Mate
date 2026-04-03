import 'package:flutter/material.dart';
import 'package:campusmate/data/attendance_data.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // ADD SUBJECT
  void addSubject(String name) {
    setState(() {
      AttendanceData.subjects.add({"name": name, "present": 0, "total": 0});
    });
  }

  // SHOW ADD SUBJECT DIALOG
  void showAddDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Subject"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: "Subject Name"),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                addSubject(controller.text);
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // CALCULATE PERCENTAGE
  double getPercentage(int index) {
    int present = AttendanceData.subjects[index]["present"];
    int total = AttendanceData.subjects[index]["total"];

    if (total == 0) return 0;
    return (present / total) * 100;
  }

  // MARK ATTENDANCE POPUP
  void markAttendance(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AttendanceData.subjects[index]["name"]),
        content: const Text("Mark Attendance"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                AttendanceData.subjects[index]["present"]++;
                AttendanceData.subjects[index]["total"]++;
              });
              Navigator.pop(context);
            },
            child: const Text("Present"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                AttendanceData.subjects[index]["total"]++;
              });
              Navigator.pop(context);
            },
            child: const Text("Absent"),
          ),
        ],
      ),
    );
  }

  // STATUS MESSAGE
  String getMessage(double percentage) {
    if (percentage < 75) {
      return "⚠️ Your attendance is short";
    } else {
      return "✅ Your attendance is fine";
    }
  }

  Color getColor(double percentage) {
    if (percentage < 75) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  // DELETE SUBJECT
  void deleteSubject(int index) {
    setState(() {
      AttendanceData.subjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Tracker")),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),

      body: AttendanceData.subjects.isEmpty
          ? const Center(child: Text("No subjects added"))
          : ListView.builder(
              itemCount: AttendanceData.subjects.length,
              itemBuilder: (context, index) {
                double percentage = getPercentage(index);

                return GestureDetector(
                  onTap: () => markAttendance(index),

                  onLongPress: () => deleteSubject(index),

                  child: Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AttendanceData.subjects[index]["name"],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Attendance: ${percentage.toStringAsFixed(1)}%",
                            style: TextStyle(
                              fontSize: 16,
                              color: getColor(percentage),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            getMessage(percentage),
                            style: TextStyle(color: getColor(percentage)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
