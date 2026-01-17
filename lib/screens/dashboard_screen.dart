import 'package:flutter/material.dart';
import 'detail_protein_screen.dart';
import 'water_tracker_screen.dart';
import 'protein_screen_store.dart';
import 'profile_screen.dart';
import '../models/protein_data.dart';
import '../models/artikel_data.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProteinStoreScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: const Text("BELI PROTEIN SEKARANG",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A237E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 320,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF3949AB), Color(0xFF1A237E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Halo, Champ! 👋",
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              Text("Ayo penuhi protein harianmu!",
                                  style: TextStyle(color: Colors.white70, fontSize: 14)),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.storefront, color: Colors.white, size: 28),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ProteinStoreScreen()),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.person_pin, color: Colors.white, size: 35),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      _buildProgressCard(),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Today's Summary 📊",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatBox("Calories", chickenBreastData.calories, Colors.orange),
                      _buildStatBox("Carbs", chickenBreastData.carbs, Colors.green),
                      _buildStatBox("Fats", chickenBreastData.fat, Colors.red),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text("Recommended Protein 🍗",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  _proteinCard(context, chickenBreastData),
                  _proteinCard(context, boiledEggsData),
                  _proteinCard(context, grilledFishData),
                  _proteinCard(context, wheyProteinData),
                  _proteinCard(context, greekYogurtData),
                  _proteinCard(context, tempehData),

                  const SizedBox(height: 30),

                  const Text("Daily Meal Logs 🍽️",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  _buildMealLogCard("Breakfast", "2 Boiled Eggs", "12g Protein", Colors.orange),
                  _buildMealLogCard("Lunch", "Chicken Breast & Rice", "31g Protein", Colors.indigo),
                  _buildMealLogCard("Snack", "Whey Protein Shake", "24g Protein", Colors.purple),

                  const SizedBox(height: 30),

                  const Text("Water Intake Tracker 💧",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  _buildWaterTracker(context),

                  const SizedBox(height: 30),

                  const Text("Nutrition Education 📖",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listArtikel.length,
                      itemBuilder: (context, index) {
                        return _buildArticleCard(context, listArtikel[index]);
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  _buildMotivationBox(),

                  const SizedBox(height: 30),

                  const Text("Daily Nutrition Tips 💡",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  const SizedBox(height: 15),
                  _buildTipCard("Konsumsi protein 1.6g - 2.2g per kg berat badan."),
                  _buildTipCard("Distribusikan asupan protein di setiap waktu makan."),
                  _buildTipCard("Cukupi serat dari sayuran agar pencernaan lancar."),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildArticleCard(BuildContext context, ArtikelModel artikel) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                Icon(artikel.icon, color: artikel.themeColor),
                const SizedBox(width: 10),
                Expanded(child: Text(artikel.title, style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            content: SingleChildScrollView(child: Text(artikel.content, style: const TextStyle(height: 1.5))),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("CLOSE")),
            ],
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 15, bottom: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [artikel.themeColor.withOpacity(0.7), artikel.themeColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: artikel.themeColor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(artikel.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                Icon(artikel.icon, color: Colors.white24, size: 24),
              ],
            ),
            const SizedBox(height: 10),
            Text(artikel.subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                  child: const Text("Read More →", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealLogCard(String time, String menu, String protein, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Container(width: 5, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10))),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(menu, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(protein, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularProgressIndicator(
            value: 0.65,
            color: Colors.orangeAccent,
            backgroundColor: Colors.white24,
            strokeWidth: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Protein Goal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text("100g / 150g", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
            ],
          ),
          Icon(Icons.emoji_events, color: Colors.amber, size: 40),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
        ],
      ),
    );
  }

  Widget _proteinCard(BuildContext context, ProteinModel data) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProteinScreen(data: data)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Hero(tag: data.name, child: CircleAvatar(backgroundColor: data.themeColor.withOpacity(0.1), child: Icon(data.icon, color: data.themeColor))),
          title: Text(data.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
          subtitle: Text(data.totalProtein, style: const TextStyle(color: Colors.grey)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildWaterTracker(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_drink, color: Colors.blue, size: 30),
          const SizedBox(width: 15),
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("6 of 8 glasses", style: TextStyle(fontWeight: FontWeight.bold)), Text("Stay hydrated for recovery!", style: TextStyle(color: Colors.grey, fontSize: 12))])),
          TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const WaterTrackerScreen())); }, child: const Text("DETAIL +", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildMotivationBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1A237E), Color(0xFF3949AB)]), borderRadius: BorderRadius.circular(20)),
      child: const Column(children: [Icon(Icons.format_quote, color: Colors.white24, size: 40), Text("\"Discipline is doing what needs to be done, even if you don't want to do it.\"", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 13))]),
    );
  }

  Widget _buildTipCard(String tip) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.indigo.withOpacity(0.1))),
      child: Row(children: [const Icon(Icons.check_circle, color: Colors.green, size: 20), const SizedBox(width: 12), Expanded(child: Text(tip, style: const TextStyle(fontSize: 13, color: Colors.black87)))]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    var controlPoint = Offset(size.width / 2, size.height + 20);
    var endPoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}