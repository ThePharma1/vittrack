import 'package:flutter/material.dart';
import 'data.dart';

class VitaminPage extends StatelessWidget {
  final VitaminInfo info;
  final String recommendation;
  final int age;
  final double weight;
  final double height;
  final String gender;
  final String symptom;
  final double calculatedDose;

  const VitaminPage({
    super.key,
    required this.info,
    this.recommendation = "",
    this.age = 0,
    this.weight = 0,
    this.height = 0,
    this.gender = "",
    this.symptom = "",
    this.calculatedDose = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info.name),
        backgroundColor: const Color.fromARGB(255, 255, 194, 80),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Vitamin: ${info.name}"),
            Text("Age: $age"),
            Text("Weight: $weight kg"),
            Text("Height: $height cm"),
            Text("Gender: $gender"),
            Text("Symptom: $symptom"),
            const SizedBox(height: 12),
            Text("Recommended Dose: $calculatedDose"),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  info.image,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Benefits"),
                subtitle: Text(info.benefits),
                leading: const Icon(
                  Icons.health_and_safety,
                  color: Color.fromARGB(255, 255, 194, 80),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Notes"),
                subtitle: Text(info.notes),
                leading: const Icon(
                  Icons.note,
                  color: Color.fromARGB(255, 255, 194, 80),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 194, 80),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
