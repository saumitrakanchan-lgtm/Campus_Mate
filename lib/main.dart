import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CampusMateApp());
}

class CampusMateApp extends StatelessWidget {
  const CampusMateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
