// Cyrine Hariri & Reine El Kadiri
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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: const HomePage(),
    );
  }
}
