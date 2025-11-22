import 'package:flutter/material.dart';
import 'data.dart';
import 'vitamin_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 194, 80),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: const Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "VITRACK\n",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Tap a vitamin to see details.",
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 180, 54, 16),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                          builder: (_) => VitaminPage(info: vitamin),
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
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          vitamin.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:Color.fromARGB(255, 255, 152, 17),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          Container(
            color: Color.fromARGB(255, 255, 194, 80), 
            padding: const EdgeInsets.symmetric(vertical: 12),
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
    );
  }
}
