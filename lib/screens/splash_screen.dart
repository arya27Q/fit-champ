import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart'; // Pastikan import ini mengarah ke file onboarding

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi otomatis setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          // Sekarang diarahkan ke OnboardingScreen, bukan LoginScreen lagi
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3949AB), Color(0xFF1A237E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ikon Logo Utama
            const Icon(Icons.fitness_center_rounded, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "PRO-FIT",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 5,
              ),
            ),
            const SizedBox(height: 50),

            // Efek Loading
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Preparing Your Gains...",
              style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}