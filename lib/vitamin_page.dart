import 'package:flutter/material.dart';
import 'data.dart';

class VitaminPage extends StatelessWidget {
  final VitaminInfo info;
  const VitaminPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info.name),
        backgroundColor: Color.fromARGB(255, 255, 194, 80),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
                title: const Text("Dosage"),
                subtitle: Text(info.dosage),
                leading: const Icon(Icons.medical_services, color: Color.fromARGB(255, 255, 194, 80)),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Benefits"),
                subtitle: Text(info.benefits),
                leading: const Icon(Icons.health_and_safety, color: Color.fromARGB(255, 255, 194, 80)),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Notes"),
                subtitle: Text(info.notes),
                leading: const Icon(Icons.note, color:Color.fromARGB(255, 255, 194, 80)),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 194, 80)),
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
