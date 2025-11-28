import 'data.dart';

class DosageCalculator {
  final VitaminInfo vitamin;
  final int age;
  final double weight;
  final double height;
  final String gender;
  final String symptom;

  DosageCalculator(this.vitamin,this.age,this.weight,this.height,this.gender,this.symptom,);

  double get bmi => weight / ((height / 100) * (height / 100));

  double calculate() {
    double dose;

    if (vitamin.name == "Vitamin C") {
      dose = weight * 10;

    } else if (vitamin.name == "Vitamin D") {
      if (age < 18) {
        dose = 400;
      } else {
        dose = 800;
      }

    } else if (vitamin.name == "Vitamin B12") {
      dose = 300;

    } else if (vitamin.name == "Omega-3") {
      dose = 500;

    } else if (vitamin.name == "Magnesium") {
      dose = weight * 4;

    } else if (vitamin.name == "Biotin") {
      dose = 50;

    } else {
      dose = 0;
    }

    if (bmi < 18.5) {
      dose *= 0.9;
    } else if (bmi >= 25) {
      dose *= 1.1;
    }

    return dose;
  }

  static VitaminInfo vitaminName(String name) {
    for (var v in vitaminList) {
      if (v.name == name) {
        return v;
      }
    }
    return vitaminList[0];
  }

  static VitaminInfo recommendVitamin(int age, String symptom) {
    if (symptom == "Low immunity" ||symptom == "Frequent colds") {
      return vitaminName("Vitamin C");
    }
    else if (symptom == "Poor sun exposure"||symptom == "Bone weakness") {
      return vitaminName("Vitamin D");
    }
    else if (symptom == "Fatigue" ||symptom == "Poor memory") {
      return vitaminName("Vitamin B12");
    }
    else if (symptom == "Heart health" ||symptom == "Joint pain") {
      return vitaminName("Omega-3");
    }
    else if (symptom == "Muscle cramps" || symptom == "Stress") {
      return vitaminName("Magnesium");
    }
    else if (symptom == "Hair/nail weakness") {
      return vitaminName("Biotin");
    }
    else {
      if (age < 18) {
        return vitaminName("Vitamin D");
      } else if (age < 50) {
        return vitaminName("Vitamin C");
      } else {
        return vitaminName("Vitamin B12");
      }
    }
  }
}
