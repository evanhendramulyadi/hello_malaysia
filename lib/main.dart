import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navyColor = Color(0xFF012B47);
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      body: SingleChildScrollView(
        // Biar aman kalau layar HP pendek
        child: Column(
          children: [
            // STACK SEKARANG MENGIKUTI TINGGI GAMBAR
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // 1. GAMBAR (Patokan Tinggi)
                Image.asset(
                  'assets/images/welcome-screen.png',
                  width: double.infinity,
                  fit: BoxFit
                      .fitWidth, // Gambar memenuhi lebar, tinggi otomatis menyesuaikan rasio
                ),

                // 2. TOMBOL-TOMBOL (Sekarang patokannya bawah GAMBAR, bukan bawah LAYAR)
                Positioned(
                  bottom:
                      20, // Jarak tombol dari bawah gambar (sesuaikan biar pas)
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TOMBOL EXPLORE TOURISM
                      _buildButton(
                        label: 'Explore Tourism',
                        icon: Icons.explore_outlined,
                        bgColor: navyColor,
                        textColor: kremColor,
                      ),

                      const SizedBox(width: 15), // Jarak antar tombol
                      // TOMBOL DISCOVER CULTURE
                      _buildButton(
                        label: 'Discover Culture',
                        icon: Icons.museum_outlined,
                        bgColor: Colors.transparent,
                        textColor: kremColor,
                        isOutlined: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Area krem di bawah gambar (opsional, biar kalau di-scroll tetap krem)
            Container(height: 200, color: kremColor),
          ],
        ),
      ),
    );
  }

  // Fungsi Helper biar kode lo nggak berantakan kebanyakan copy-paste
  Widget _buildButton({
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: 135, // Sesuaikan lebar agar pas di layar
      height: 38,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: isOutlined ? 0 : 5,
          side: isOutlined
              ? BorderSide(color: textColor, width: 2)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        onPressed: () {
          debugPrint("$label clicked");
        },
        icon: Icon(icon, size: 18),
        label: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
