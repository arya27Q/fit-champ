import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Welcome Back, Champ! 🏆",
      "subtitle": "It's time to be healthy & strong.",
      "icon": Icons.star_rounded,
      "color": Colors.amber
    },
    {
      "title": "Track Your Gains ⚡",
      "subtitle": "Monitor your protein intake and workouts easily.",
      "icon": Icons.fitness_center_rounded,
      "color": Colors.white
    },
    {
      "title": "Fuel Your Body 🍎",
      "subtitle": "Get the best supplements for your fitness journey.",
      "icon": Icons.shopping_basket_rounded,
      "color": Colors.greenAccent
    },
  ];

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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => _buildPageContent(index),
            ),

            Positioned(
              bottom: 60,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                          (index) => _buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 40),


                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    height: _currentPage == onboardingData.length - 1 ? 60 : 0,
                    child: _currentPage == onboardingData.length - 1
                        ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "GET STARTED",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            onboardingData[index]['icon'],
            size: 100,
            color: onboardingData[index]['color'],
          ),
          const SizedBox(height: 40),
          Text(
            onboardingData[index]['title'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            onboardingData[index]['subtitle'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.amber : Colors.white38,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}