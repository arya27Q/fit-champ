import 'package:flutter/material.dart';

class ProteinStoreScreen extends StatefulWidget {
  const ProteinStoreScreen({super.key});

  @override
  State<ProteinStoreScreen> createState() => _ProteinStoreScreenState();
}

class _ProteinStoreScreenState extends State<ProteinStoreScreen> {

  List<Map<String, dynamic>> cart = [];
  String selectedMethod = "";
  final TextEditingController _promoController = TextEditingController();
  bool _isPromoApplied = false;

  void _addToCart(String name, String price, IconData icon, Color color) {
    setState(() {
      cart.add({
        'name': name,
        'price': price,
        'icon': icon,
        'color': color,
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$name ditambah ke keranjang!"),
        duration: const Duration(seconds: 1),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text("Protein Store 🛒", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: cart.isEmpty
          ? null
          : FloatingActionButton.extended(
        onPressed: () => _showPaymentSheet(context),
        backgroundColor: const Color(0xFF1A237E),
        icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
        label: Text("Checkout (${cart.length} Item)", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Premium Supplements ✨", "Kualitas tertinggi"),
            _buildStoreItem("Whey Gold Isolate", "Rp 950.000", Icons.workspace_premium, Colors.purple),
            _buildStoreItem("Hydrolyzed Whey", "Rp 1.100.000", Icons.bolt, Colors.deepPurple),

            const SizedBox(height: 25),
            _buildSectionTitle("Reguler Series ⚡", "Keseimbangan harga"),
            _buildStoreItem("Standard Whey Blend", "Rp 650.000", Icons.fitness_center, Colors.blue),
            _buildStoreItem("Casein Protein", "Rp 720.000", Icons.nights_stay, Colors.indigo),

            const SizedBox(height: 25),
            _buildSectionTitle("Standart / Economic 📦", "Pilihan ekonomis"),
            _buildStoreItem("Mass Gainer Plus", "Rp 450.000", Icons.layers, Colors.orange),
            _buildStoreItem("Creatine Powder", "Rp 280.000", Icons.flash_on, Colors.green),

            const SizedBox(height: 30),
            _buildPromoBanner(),
            const SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
        Text(subTitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildStoreItem(String name, String price, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(price, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _addToCart(name, price, icon, color),
            icon: const Icon(Icons.add_shopping_cart, color: Color(0xFF1A237E)),
            tooltip: "Tambah ke Keranjang",
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF3949AB), Color(0xFF1A237E)]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.indigo.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: const Row(
        children: [
          Icon(Icons.stars, color: Colors.amber, size: 45),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Voucher New Champ! 🔥", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Gunakan kode 'PROTEINWIN' di checkout.", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showPaymentSheet(BuildContext context) {
    selectedMethod = "";
    _isPromoApplied = false;
    _promoController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Ringkasan Pesanan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),

                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(cart[index]['icon'], color: cart[index]['color'], size: 20),
                              title: Text(cart[index]['name'], style: const TextStyle(fontSize: 14)),
                              trailing: Text(cart[index]['price'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            );
                          },
                        ),
                      ),
                      const Divider(),

                      const Text("Kode Promo", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _promoController,
                              decoration: InputDecoration(
                                hintText: "Masukkan 'PROTEINWIN'...",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setModalState(() {
                                if (_promoController.text.toUpperCase() == "PROTEINWIN") {
                                  _isPromoApplied = true;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                            child: const Text("KLAIM", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      if (_isPromoApplied)
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text("Promo Berhasil: Diskon Rp 50.000 Aktif! ✅",
                              style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),

                      const SizedBox(height: 20),
                      const Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
                      _paymentOption(setModalState, "GOPAY / OVO", Icons.account_balance_wallet, Colors.blue),
                      _paymentOption(setModalState, "Transfer Bank", Icons.account_balance, Colors.indigo),

                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: selectedMethod == "" ? null : () {
                            Navigator.pop(context);
                            _showSuccessDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Text(_isPromoApplied ? "KONFIRMASI BAYAR (Diskon +)" : "KONFIRMASI BAYAR",
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }

  Widget _paymentOption(StateSetter setModalState, String title, IconData icon, Color color) {
    bool isSelected = selectedMethod == title;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: Icon(isSelected ? Icons.check_circle : Icons.radio_button_off, color: isSelected ? Colors.green : Colors.grey),
      onTap: () => setModalState(() => selectedMethod = title),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle, color: Colors.green, size: 80),
            ),
            const SizedBox(height: 20),
            const Text("Pembayaran Berhasil!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF1A237E))),
            const SizedBox(height: 10),
            Text(
              "Hore! Berhasil memesan ${cart.length} produk via $selectedMethod. Pesanan sedang disiapkan.",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cart.clear();
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("MANTAP!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
              ),
            ),
          )
        ],
      ),
    );
  }
}