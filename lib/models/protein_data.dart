import 'package:flutter/material.dart';

class ProteinModel {
  final String name;
  final String totalProtein;
  final String calories;
  final String fat;
  final String carbs;
  final Color themeColor;
  final IconData icon;
  final List<String> vitamins;
  final List<Map<String, String>> nutritionFacts;
  final List<String> preparationSteps;
  final String benefits;

  ProteinModel({
    required this.name,
    required this.totalProtein,
    required this.calories,
    required this.fat,
    required this.carbs,
    required this.themeColor,
    required this.icon,
    required this.vitamins,
    required this.nutritionFacts,
    required this.preparationSteps,
    required this.benefits,
  });
}

final chickenBreastData = ProteinModel(
  name: "Chicken Breast",
  totalProtein: "31g Protein",
  calories: "165 kcal",
  fat: "3.6g",
  carbs: "0g",
  themeColor: Colors.indigo,
  icon: Icons.restaurant_rounded,
  vitamins: ["Vitamin B12", "Iron", "Zinc", "Magnesium", "Vitamin B6"],
  nutritionFacts: [
    {"label": "Total Protein", "value": "31.2 g"},
    {"label": "Saturated Fat", "value": "1.0 g"},
    {"label": "Cholesterol", "value": "85 mg"},
    {"label": "Sodium", "value": "74 mg"},
  ],
  preparationSteps: [
    "Bersihkan dada ayam dan keringkan.",
    "Marinasi dengan lada dan perasan lemon.",
    "Panggang (grill) selama 6-8 menit tiap sisi.",
  ],
  benefits: "Sangat baik untuk pemulihan otot intensif karena rendah lemak.",
);

final boiledEggsData = ProteinModel(
  name: "Boiled Eggs",
  totalProtein: "12g Protein",
  calories: "155 kcal",
  fat: "11g",
  carbs: "1.1g",
  themeColor: Colors.orange,
  icon: Icons.egg_rounded,
  vitamins: ["Vitamin D", "Vitamin A", "B12", "Folate"],
  nutritionFacts: [
    {"label": "Protein", "value": "12.6 g"},
    {"label": "Healthy Fat", "value": "10.6 g"},
    {"label": "Cholesterol", "value": "373 mg"},
  ],
  preparationSteps: [
    "Rebus air hingga mendidih.",
    "Masak telur selama 9-12 menit.",
    "Rendam di air es sebelum dikupas.",
  ],
  benefits: "Mengandung kolin yang bagus untuk fungsi otak dan metabolisme lemak.",
);

final grilledFishData = ProteinModel(
  name: "Grilled Fish",
  totalProtein: "22g Protein",
  calories: "200 kcal",
  fat: "12g",
  carbs: "0g",
  themeColor: Colors.blue,
  icon: Icons.set_meal_rounded,
  vitamins: ["Omega-3", "Vitamin D", "Selenium"],
  nutritionFacts: [
    {"label": "Protein", "value": "22.0 g"},
    {"label": "Omega-3", "value": "2.5 g"},
    {"label": "Total Fat", "value": "12.3 g"},
  ],
  preparationSteps: [
    "Bumbui fillet ikan dengan garam dan jeruk nipis.",
    "Panggang di atas pan hingga kecokelatan.",
    "Sajikan dengan sayuran hijau.",
  ],
  benefits: "Asam lemak Omega-3 membantu mengurangi peradangan otot.",
);

final wheyProteinData = ProteinModel(
  name: "Whey Protein",
  totalProtein: "24g Protein",
  calories: "120 kcal",
  fat: "1.5g",
  carbs: "3g",
  themeColor: Colors.purple,
  icon: Icons.local_drink_rounded,
  vitamins: ["BCAA", "Leucine", "Glutamine"],
  nutritionFacts: [
    {"label": "Protein", "value": "24.0 g"},
    {"label": "BCAA", "value": "5.5 g"},
    {"label": "Sugar", "value": "1.0 g"},
  ],
  preparationSteps: [
    "Masukkan 1 scoop whey ke dalam shaker.",
    "Tambahkan 250ml air dingin.",
    "Kocok hingga larut dan segera minum.",
  ],
  benefits: "Penyerapan tercepat untuk jendela anabolik pasca latihan.",
);


final greekYogurtData = ProteinModel(
  name: "Greek Yogurt",
  totalProtein: "10g Protein",
  calories: "59 kcal",
  fat: "0.4g",
  carbs: "3.6g",
  themeColor: Colors.teal,
  icon: Icons.breakfast_dining_rounded,
  vitamins: ["Calcium", "Probiotics", "B12"],
  nutritionFacts: [
    {"label": "Total Protein", "value": "10.0 g"},
    {"label": "Calcium", "value": "110 mg"},
  ],
  preparationSteps: [
    "Sajikan dalam keadaan dingin.",
    "Campur dengan kacang almond atau buah.",
  ],
  benefits: "Probiotik membantu kesehatan pencernaan.",
);


final tempehData = ProteinModel(
  name: "Tempeh",
  totalProtein: "19g Protein",
  calories: "192 kcal",
  fat: "11g",
  carbs: "9g",
  themeColor: Colors.brown,
  icon: Icons.eco_rounded,
  vitamins: ["Iron", "Magnesium", "Vitamin B6"],
  nutritionFacts: [
    {"label": "Total Protein", "value": "19.0 g"},
    {"label": "Fiber", "value": "7.0 g"},
  ],
  preparationSteps: [
    "Potong tempe tipis-tipis.",
    "Kukus atau panggang sebentar.",
  ],
  benefits: "Sumber protein nabati terbaik dengan serat tinggi.",
);