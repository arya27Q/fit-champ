import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(const ProFitApp());

class ProFitApp extends StatelessWidget {
  const ProFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro-Fit Tracker',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange, 
      ),
      home: const LoginScreen(),
    );
  }
}