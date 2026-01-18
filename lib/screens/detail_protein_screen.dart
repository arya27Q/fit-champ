import 'package:flutter/material.dart';
import '../models/protein_data.dart'; 

class DetailProteinScreen extends StatelessWidget {
  final ProteinModel data; 

  const DetailProteinScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text(data.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Hero(
                tag: data.name,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: data.themeColor.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(data.icon, size: 100, color: data.themeColor),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(data.name,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1A237E))),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: data.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(data.totalProtein,
                  style: TextStyle(fontSize: 18, color: data.themeColor, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMiniInfo("Calories", data.calories, Colors.orange),
                  _buildMiniInfo("Fat", data.fat, Colors.red),
                  _buildMiniInfo("Carbs", data.carbs, Colors.green),
                ],
              ),
            ),

            const SizedBox(height: 40),

            _buildSectionHeader("Health Benefits"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                data.benefits,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.5),
              ),
            ),

            const SizedBox(height: 30),

            _buildSectionHeader("Vitamins & Minerals"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: data.vitamins.map((v) => _buildChip(v, data.themeColor)).toList(),
              ),
            ),

            const SizedBox(height: 30),

            _buildSectionHeader("Nutrition Facts (per 100g)"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade200, width: 1, borderRadius: BorderRadius.circular(15)),
                  children: data.nutritionFacts.map((fact) => _buildTableRow(fact['label']!, fact['value']!)).toList(),
                ),
              ),
            ),

            const SizedBox(height: 30),

            _buildSectionHeader("Healthy Way to Prepare"),
            ...List.generate(data.preparationSteps.length, (index) {
              return _buildStepItem("${index + 1}", data.preparationSteps[index]);
            }),

            const SizedBox(height: 30),

            _buildSectionHeader("Meal Plan Ideas"),
            _buildMealItem("Breakfast", "Healthy portion of ${data.name} to start your day."),
            _buildMealItem("Lunch", "Grilled ${data.name} with fresh vegetables."),
            _buildMealItem("Dinner", "Light salad topped with ${data.name}."),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    shadowColor: const Color(0xFF1A237E).withOpacity(0.4),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("BACK TO DASHBOARD",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12), child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500))),
        Padding(padding: const EdgeInsets.all(12), child: Text(value, textAlign: TextAlign.right)),
      ],
    );
  }

  Widget _buildMealItem(String time, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(time, style: TextStyle(fontWeight: FontWeight.bold, color: data.themeColor)),
            const SizedBox(width: 15),
            Expanded(child: Text(desc, style: const TextStyle(fontSize: 13))),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
        ),
      ),
    );
  }

  Widget _buildMiniInfo(String label, String value, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      backgroundColor: color.withOpacity(0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildStepItem(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: data.themeColor,
            child: Text(number, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: TextStyle(color: Colors.grey[800], fontSize: 14))),
        ],
      ),
    );
  }
}