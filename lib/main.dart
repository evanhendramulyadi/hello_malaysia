import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';
import 'culture_page.dart';
import 'tourism.dart'; // Import halaman tourism

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
        child: Column(
          children: [
            // 1. BANNER UTAMA DENGAN TOMBOL
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/welcome-screen.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 22,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        context: context,
                        label: 'Explore Tourism',
                        icon: Icons.explore_outlined,
                        bgColor: navyColor,
                        textColor: kremColor,
                        onPressed: () {
                          // NAVIGASI KE TOURISM PAGE
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TourismPage()),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      _buildButton(
                        context: context,
                        label: 'Discover Culture',
                        icon: Icons.museum_outlined,
                        bgColor: Colors.transparent,
                        textColor: kremColor,
                        isOutlined: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CulturePage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // 2. FOTO STORY FULL
            Image.asset(
              'assets/images/story-full.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // 3. FOTO TOURISM & HERITAGE
            Image.asset(
              'assets/images/tourism-heritage.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            const SizedBox(height: 25),

            // 4. FOTO GEOGRAPHIC & CULINER (Teks merah dihapus)
            Image.asset(
              'assets/images/geo-culiner.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            const SizedBox(height: 25),

            // 5. INSPIRING FIGURES
            Image.asset(
              'assets/images/inspiring-figures.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // 6. NATION DIVERSITY
            Image.asset(
              'assets/images/nation-diversity.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // 7. STORY ABOUT US
            Image.asset(
              'assets/images/story-about-us.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // JARAK PENUTUP DI BAWAH
            const SizedBox(height: 30), 
          ],
        ),
      ),
    );
  }

  // Fungsi Helper Tombol
  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
    required VoidCallback onPressed,
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: 135,
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
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}