import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFF1A237E),
                        child: Icon(Icons.person, size: 80, color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.orangeAccent,
                        child: IconButton(
                          icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text("Champ User",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const Text("Protein Tracking Enthusiast",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProfileStat("Weight", "75 kg"),
                  _buildProfileStat("Height", "175 cm"),
                  _buildProfileStat("Goal", "Bulking"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _buildProfileMenu(Icons.settings, "Account Settings"),
            _buildProfileMenu(Icons.history, "Nutrition History"),
            _buildProfileMenu(Icons.help_outline, "Help & Support"),
            _buildProfileMenu(Icons.privacy_tip_outlined, "Privacy Policy"),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () => Navigator.pop(context), // Simulasi logout
                  child: const Text("LOGOUT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF1A237E)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),

          onTap: () {

            debugPrint("Membuka $title");
          },
        ),
      ),
    );
  }
}