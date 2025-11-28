import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const VitaminApp());
}

class VitaminApp extends StatelessWidget {
  const VitaminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vitamin Guide",
      home: const HomePage(),
    );
  }
}
