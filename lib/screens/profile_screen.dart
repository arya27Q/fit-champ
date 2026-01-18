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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(context),
            const SizedBox(height: 30),
            _buildStatsSection(),
            const SizedBox(height: 30),

            // MENU INTERAKTIF
            _buildProfileMenu(
                context,
                Icons.settings,
                "Account Settings",
                "Perbarui data fisik dan keamanan akun kamu.",
                _showAccountSettings
            ),
            _buildProfileMenu(
                context,
                Icons.history,
                "Nutrition History",
                "Lihat progres asupan protein harian kamu.",
                _showNutritionHistory
            ),
            _buildProfileMenu(
                context,
                Icons.help_outline,
                "Help & Support",
                "Hubungi tim support atau baca panduan aplikasi.",
                _showHelpSupport
            ),
            _buildProfileMenu(
                context,
                Icons.privacy_tip_outlined,
                "Privacy Policy",
                "Informasi mengenai keamanan data pengguna.",
                _showPrivacyPolicy
            ),

            const SizedBox(height: 40),
            _buildLogoutButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- HEADER: FOTO DENGAN FITUR GANTI FOTO ---
  Widget _buildProfileHeader(BuildContext context) {
    return Center(
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
              // Tombol Edit Foto Profil
              GestureDetector(
                onTap: () => _showPicker(context),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.orangeAccent,
                  child: Icon(Icons.camera_alt, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text("Champ User", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
          const Text("Mahasiswa & Protein Enthusiast", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 5),
          // Tombol Edit Bio di bawah nama
          TextButton.icon(
            onPressed: () => _showEditProfile(context),
            icon: const Icon(Icons.edit, size: 14, color: Colors.indigo),
            label: const Text("Edit Bio", style: TextStyle(color: Colors.indigo, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  // --- MODAL: PICKER FOTO PROFIL ---
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Pilih dari Galeri'),
                  onTap: () => Navigator.of(context).pop()),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Ambil Kamera'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildProfileStat("Weight", "75 kg"),
          _buildProfileStat("Height", "175 cm"),
          _buildProfileStat("Goal", "Bulking"),
        ],
      ),
    );
  }

  void _showEditProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 25, right: 25, top: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Update Profile Info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildField("Nama Lengkap", "Champ User"),
            const SizedBox(height: 15),
            _buildField("Bio Singkat", "Semangat mengejar gains!"),
            const SizedBox(height: 25),
            _buildActionButton(context, "SIMPAN PERUBAHAN", Colors.indigo, () => Navigator.pop(context)),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void _showAccountSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Data Fisik & Akun", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildField("Berat (kg)", "75")),
                const SizedBox(width: 15),
                Expanded(child: _buildField("Tinggi (cm)", "175")),
              ],
            ),
            const SizedBox(height: 15),
            _buildField("Email", "champ@student.com"),
            const SizedBox(height: 15),
            _buildField("Password", "********"),
            const SizedBox(height: 25),
            _buildActionButton(context, "UPDATE DATA", Colors.green, () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }

  void _showNutritionHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Riwayat Nutrisi (7 Hari Terakhir)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildHistoryItem("Minggu, 18 Jan", "120g Protein", Colors.green),
                  _buildHistoryItem("Sabtu, 17 Jan", "95g Protein", Colors.orange),
                  _buildHistoryItem("Jumat, 16 Jan", "110g Protein", Colors.green),
                  _buildHistoryItem("Kamis, 15 Jan", "80g Protein", Colors.red),
                  _buildHistoryItem("Rabu, 14 Jan", "130g Protein", Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pusat Bantuan"),
        content: const Text("Butuh bantuan? Hubungi kami via WhatsApp di +62 812-3456-7890 atau email support@pro-fit.com"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OKE"))],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Kebijakan Privasi"),
        content: const SingleChildScrollView(
          child: Text("Kami berkomitmen menjaga data kesehatan dan informasi pribadi kamu dengan enkripsi standar industri. Data kamu tidak akan dibagikan ke pihak ketiga tanpa izin."),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("MENGERTI"))],
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String val, Color col) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        leading: Icon(Icons.insights, color: col),
        title: Text(date, style: const TextStyle(fontSize: 14)),
        trailing: Text(val, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context, IconData icon, String title, String sub, Function action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)]
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFF1A237E).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: const Color(0xFF1A237E), size: 20),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          subtitle: Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          onTap: () => action(context),
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)]
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A237E), fontSize: 16)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.logout, size: 18),
          label: const Text("LOGOUT", style: TextStyle(fontWeight: FontWeight.bold)),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}