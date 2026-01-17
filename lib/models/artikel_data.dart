import 'package:flutter/material.dart';

class ArtikelModel {
  final String title;
  final String subtitle;
  final Color themeColor;
  final String content;
  final IconData icon;

  ArtikelModel({
    required this.title,
    required this.subtitle,
    required this.themeColor,
    required this.content,
    required this.icon,
  });
}

// Data artikel lengkap untuk Nutrition Education
final List<ArtikelModel> listArtikel = [
  ArtikelModel(
    title: "Leucine Power",
    subtitle: "Kunci utama pertumbuhan massa otot.",
    themeColor: Colors.blue,
    icon: Icons.bolt,
    content: "Leucine adalah asam amino esensial yang memicu sintesis protein otot. Pastikan asupan Leucine cukup setelah latihan beban!",
  ),
  ArtikelModel(
    title: "Anabolic Window",
    subtitle: "Mitos atau Fakta waktu makan protein?",
    themeColor: Colors.green,
    icon: Icons.timer,
    content: "Penelitian terbaru menunjukkan bahwa total asupan protein harian lebih penting daripada sekadar makan tepat setelah gym.",
  ),
  ArtikelModel(
    title: "Fiber & Protein",
    subtitle: "Serat membantu penyerapan nutrisi.",
    themeColor: Colors.orange,
    icon: Icons.bakery_dining,
    content: "Kombinasi protein dengan serat (sayuran) memastikan pencernaan lancar dan penyerapan asam amino lebih maksimal.",
  ),
  ArtikelModel(
    title: "Hydration Recovery",
    subtitle: "Air putih untuk pemulihan otot.",
    themeColor: Colors.cyan,
    icon: Icons.water_drop,
    content: "Otot mengandung 75% air. Kurang hidrasi bisa menyebabkan kram dan penurunan performa latihan kamu.",
  ),
];