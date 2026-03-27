import 'package:flutter/material.dart';

class CGPAScreen extends StatefulWidget {
  const CGPAScreen({super.key});
  @override
  State<CGPAScreen> createState() => _CGPAScreenState();
}

class _CGPAScreenState extends State<CGPAScreen> {
  final TextEditingController controller = TextEditingController();
  double cgpa = 0;

  void calculateCGPA() {
    double marks = double.tryParse(controller.text) ?? 0;
    setState(() {
      cgpa = marks / 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CGPA Calculator")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Marks"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calculateCGPA, child: Text("Calculate")),
            SizedBox(height: 20),
            Text("CGPA: $cgpa"),
          ],
        ),
      ),
    );
  }
}
