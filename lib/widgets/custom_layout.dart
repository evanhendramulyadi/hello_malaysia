import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;

  const CustomLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    // Gunakan warna krem yang sama dengan background logo di screenshot
    const Color themeColor = Color(0xFFF8F0E5);
    const Color navyColor = Color(0xFF012B47);

    return Scaffold(
      backgroundColor: themeColor, // Background dasar krem
      appBar: PreferredSize(
        // Tinggi header disesuaikan supaya pas sama area krem di gambar lo
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          // Kita kasih Container warna krem biar headernya solid
          child: Container(
            color: themeColor,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGO KIRI
                // Posisi logo dibuat pas di tengah secara vertikal
                SizedBox(
                  height: 50,
                  child: Image.asset(
                    'assets/images/logo-tanpa-teks.png',
                    fit: BoxFit.contain,
                  ),
                ),
                // MENU HAMBURGER KANAN
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.menu, color: navyColor, size: 35),
                  onPressed: () {
                    // Tambahin fungsi menu di sini nanti
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // Body bakal nampilin gambar welcome-screen.png lo tepat di bawah header ini
      body: body,
    );
  }
}
