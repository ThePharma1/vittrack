class VitaminInfo {
  final String name;
  final String dosage;
  final String benefits;
  final String notes;
  final String image; 

  VitaminInfo(this.name, this.dosage, this.benefits,this.notes,this.image);
}

List<VitaminInfo> vitaminList = [
  VitaminInfo( "Vitamin C",
   "500–1000 mg daily",
   "Boosts immune system, improves skin, helps collagen production.",
   "Avoid taking too much; may cause stomach upset.",
   "assets/vitaminc.png",
  ),
  VitaminInfo(
    "Vitamin D", 
    "600–2000 IU daily",
    "Supports bone health, mood regulation, immune function.",
    "Best taken with food; sunlight also increases Vitamin D.", 
    "assets/vitamind.png",
  ),
  VitaminInfo(
    "Vitamin B12",
    "250–500 mcg daily",
    "Boosts energy, supports nerve function, prevents anemia.",
    "Vegetarians often need supplementation.",
    "assets/vitamin_b12.png",
  ),
  VitaminInfo(
    "Omega-3",
    "500–1000 mg daily",
    "Supports heart health, reduces inflammation, helps focus.",
    "Prefer fish-oil or algae-based supplements.",
    "assets/omega3.png",
  ),
  VitaminInfo(
    "Magnesium",
    "200–400 mg daily",
    "Improves sleep, relaxes muscles, reduces headaches.",
    "Take at night; can cause diarrhea if overdosed.",
    "assets/magnesium.png",
  ),
  VitaminInfo(
    "Biotin",
    "30–100 mcg daily",
    "Supports hair, skin, and nail health.",
    "Generally safe, excess rarely causes side effects.",
    "assets/biotin.png",
  ),
];
