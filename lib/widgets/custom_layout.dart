import 'package:flutter/material.dart';
import '../culture_page.dart';
import '../geography.dart';
import '../inspiring_figures.dart'; // Import halaman baru

class CustomLayout extends StatelessWidget {
  final Widget body;

  const CustomLayout({super.key, required this.body});

  // Fungsi helper buat pindah halaman
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Tutup drawer dulu
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Color(0xFFF8F0E5);
    const Color navyColor = Color(0xFF012B47);

    return Scaffold(
      backgroundColor: themeColor,

      // --- DRAWER (MENU NAVIGASI) ---
      drawer: Drawer(
        child: Container(
          color: themeColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // HEADER DRAWER CUSTOM (Posisi & Ukuran bisa diatur manual)
              Container(
                width: double.infinity,
                height: 220, // <--- Atur tinggi area navy di sini
                decoration: const BoxDecoration(color: navyColor),
                child: Align(
                  /// Alignment(x, y)
                  /// x: 0.0 (tengah), -1.0 (kiri), 1.0 (kanan)
                  /// y: 0.0 (tengah), -1.0 (atas banget), 1.0 (bawah banget)
                  /// Ubah angka 0.2 di bawah untuk naik-turunkan foto
                  alignment: const Alignment(0.0, 0.2), 
                  child: SizedBox(
                    width: 192, // <--- Atur lebar foto manual
                    height: 192, // <--- Atur tinggi foto manual
                    child: Image.asset(
                      'assets/images/logo-teks-putih.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10), // Jarak tipis antara header dan menu

              // MENU HOME
              ListTile(
                leading: const Icon(Icons.home, color: navyColor),
                title: const Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context); // Tutup drawer
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),

              // MENU CULTURE
              ListTile(
                leading: const Icon(Icons.museum, color: navyColor),
                title: const Text(
                  'Culture',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _navigateTo(context, const CulturePage());
                },
              ),

              // MENU GEOGRAPHY
              ListTile(
                leading: const Icon(Icons.public, color: navyColor),
                title: const Text(
                  'Geography',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _navigateTo(context, const GeographyPage());
                },
              ),

              // MENU INSPIRING FIGURES
              ListTile(
                leading: const Icon(Icons.people, color: navyColor),
                title: const Text(
                  'Inspiring Figures',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _navigateTo(context, const InspiringFiguresPage());
                },
              ),
            ],
          ),
        ),
      ),

      // --- APPBAR CUSTOM ---
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            // --- EDIT DISINI BUAT SHADOW ---
            decoration: BoxDecoration(
              color: themeColor, // Warna background AppBar
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // Warna bayangan hitam tipis
                  spreadRadius: 1, // Seberapa luas bayangan menyebar
                  blurRadius: 3, // Seberapa blur bayangannya
                  offset: const Offset(0, 2), // Posisi bayangan (x, y). y=2 berarti bayangan ke bawah
                ),
              ],
            ),
            // ---------------------------------
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGO KIRI
                SizedBox(
                  height: 60,
                  child: Image.asset(
                    'assets/images/logo-tanpa-teks.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // MENU HAMBURGER KANAN
                Builder(
                  builder: (context) => IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.menu, color: navyColor, size: 35),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // --- BODY HALAMAN ---
      body: body,
    );
  }
}