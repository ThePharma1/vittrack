import 'package:flutter/material.dart';
import 'data.dart';
import 'vitamin_page.dart';
import 'dosage_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String selectedGender = "Male";
  String selectedSymptom = "None";

  List<String> genders = ["Male", "Female"];
  List<String> symptoms = [
    "None",
    "Low immunity",
    "Frequent colds",
    "Fatigue",
    "Poor sun exposure",
    "Bone weakness",
    "Poor memory",
    "Heart health",
    "Joint pain",
    "Muscle cramps",
    "Stress",
    "Hair/nail weakness",
  ];

  void navigateToResult() {
    if (ageController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty) {
      return;
    }

    int age;
    var a = int.tryParse(ageController.text);
    if (a == null) {
      age = 0;
    } else {
      age = a;
    }

    double weight;
    var w = double.tryParse(weightController.text);
    if (w == null) {
      weight = 0;
    } else {
      weight = w;
    }

    double height;
    var h = double.tryParse(heightController.text);
    if (h == null) {
      height = 0;
    } else {
      height = h;
    }
    VitaminInfo recommended = DosageCalculator.recommendVitamin(
      age,
      selectedSymptom,
    );

    DosageCalculator calc = DosageCalculator(
      recommended,
      age,
      weight,
      height,
      selectedGender,
      selectedSymptom,
    );

    double dosage = calc.calculate();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VitaminPage(
          info: recommended,
          recommendation: "Based on your info:",
          age: age,
          weight: weight,
          height: height,
          gender: selectedGender,
          symptom: selectedSymptom,
          calculatedDose: dosage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color.fromARGB(255, 255, 194, 80),
              child: const Center(
                child: Text(
                  "VITRACK",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 180, 54, 16),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(),
                    ),
                    controller: ageController,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Weight (kg)",
                      border: OutlineInputBorder(),
                    ),
                    controller: weightController,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Height (cm)",
                      border: OutlineInputBorder(),
                    ),
                    controller: heightController,
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedGender,
                          items: genders.map((g) {
                            return DropdownMenuItem(value: g, child: Text(g));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedSymptom,
                          items: symptoms.map((s) {
                            return DropdownMenuItem(value: s, child: Text(s));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSymptom = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: navigateToResult,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 194, 80),
                    ),
                    child: const Text("Calculate Dosage"),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: vitaminList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  final vitamin = vitaminList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VitaminPage(info: vitamin),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              vitamin.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          vitamin.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 152, 17),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: const Color.fromARGB(255, 255, 194, 80),
              child: const Center(
                child: Text(
                  "For more info, call us at 123-456-789",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 180, 54, 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
