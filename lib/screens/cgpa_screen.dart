import 'package:flutter/material.dart';

class CGPAScreen extends StatefulWidget {
  const CGPAScreen({super.key});

  @override
  State<CGPAScreen> createState() => _CGPAScreenState();
}

class _CGPAScreenState extends State<CGPAScreen> {
  List<Map<String, dynamic>> subjects = [];

  // ADD SUBJECT
  void addSubject(String name, int credits, double grade) {
    setState(() {
      subjects.add({"name": name, "credits": credits, "grade": grade});
    });
  }

  // SHOW DIALOG
  void showAddDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController creditController = TextEditingController();
    TextEditingController gradeController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Subject"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Subject Name"),
            ),
            TextField(
              controller: creditController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Credits"),
            ),
            TextField(
              controller: gradeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Grade (0–10)"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  creditController.text.isNotEmpty &&
                  gradeController.text.isNotEmpty) {
                addSubject(
                  nameController.text,
                  int.parse(creditController.text),
                  double.parse(gradeController.text),
                );
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // CALCULATE CGPA
  double calculateCGPA() {
    double totalPoints = 0;
    int totalCredits = 0;

    for (var sub in subjects) {
      totalPoints += sub["grade"] * sub["credits"];
      totalCredits += sub["credits"] as int;
    }

    if (totalCredits == 0) return 0;

    return totalPoints / totalCredits;
  }

  // DELETE SUBJECT
  void deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double cgpa = calculateCGPA();

    return Scaffold(
      appBar: AppBar(title: const Text("CGPA Predictor")),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          // CGPA DISPLAY
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            child: Text(
              "CGPA: ${cgpa.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: subjects.isEmpty
                ? const Center(child: Text("No subjects added"))
                : ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(subjects[index]["name"]),
                          subtitle: Text(
                            "Credits: ${subjects[index]["credits"]} | Grade: ${subjects[index]["grade"]}",
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteSubject(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
