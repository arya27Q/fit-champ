import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const ProFitApp());

class ProFitApp extends StatelessWidget {
  const ProFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Champ Protein',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1A237E),
      ),
      home: const SplashScreen(),
    );
  }
}