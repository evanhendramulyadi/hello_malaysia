import 'package:flutter/material.dart';

// Import semua halaman agar Navigator bisa mengenali tujuannya
import '../culture_page.dart';
import '../geography.dart';
import '../inspiring_figures.dart';
import '../tourism.dart';
import '../culinery.dart';
import '../demography.dart';
import '../about_us.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;
  
  /// Penanda halaman mana yang sedang aktif:
  /// 0: Home, 1: Culture, 2: Tourism, 3: Geography, 4: Culinery
  /// 5: Inspiring Figures, 6: Demography, 7: About Us
  final int activeIndex;

  const CustomLayout({
    super.key, 
    required this.body, 
    this.activeIndex = 0,
  });

  // Method pembantu untuk reset total state navigasi dan kembali ke halaman Home asli
  void _forceGoToHome(BuildContext context) {
    // Menghapus semua sisa memori rute lama dan meluncurkan root '/' (Home) kembali dengan bersih
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  // Method untuk pindah halaman dari Drawer dan menutup drawer secara otomatis
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context);

    // Gunakan pushReplacement agar memori RAM bersih dan tidak menumpuk di latar belakang
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Definisi warna sesuai branding
    const Color themeColor = Color(0xFFF8F0E5);
    const Color navyColor = Color(0xFF012B47);
    const Color activeColor = Colors.blue; 

    // BUNGKUS DENGAN POPSCOPE UNTUK RESOLUSI TOMBOL BACK HP
    return PopScope(
      canPop: activeIndex == 0, // Hanya izinkan keluar aplikasi jika sedang berada di HOME
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // JIKA DI HALAMAN LAIN, SAAT BACK DITEKAN: Paksa balik ke Home tanpa menutup aplikasi
        if (activeIndex != 0) {
          _forceGoToHome(context);
        }
      },
      child: Scaffold(
        backgroundColor: themeColor,

        // --- DRAWER (MENU SAMPING) ---
        endDrawer: Drawer(
          child: Container(
            color: themeColor,
            child: Column(
              children: [
                // Header Drawer dengan Logo
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: const BoxDecoration(color: navyColor),
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo-teks-putih.png', 
                        fit: BoxFit.contain
                      ),
                    ),
                  ),
                ),
                
                // List Menu di Drawer
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 10),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.home,
                        title: 'Home',
                        activeColor: activeColor,
                        isActive: activeIndex == 0,
                        onTap: () {
                          Navigator.pop(context);
                          if (activeIndex == 0) return;
                          
                          _forceGoToHome(context);
                        },
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.museum,
                        title: 'Culture',
                        activeColor: activeColor,
                        isActive: activeIndex == 1,
                        onTap: () => _navigateTo(context, const CulturePage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.map,
                        title: 'Tourism',
                        activeColor: activeColor,
                        isActive: activeIndex == 2,
                        onTap: () => _navigateTo(context, const TourismPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.public,
                        title: 'Geography',
                        activeColor: activeColor,
                        isActive: activeIndex == 3,
                        onTap: () => _navigateTo(context, const GeographyPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.restaurant,
                        title: 'Culinery',
                        activeColor: activeColor,
                        isActive: activeIndex == 4,
                        onTap: () => _navigateTo(context, const CulineryPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.people,
                        title: 'Inspiring Figures',
                        activeColor: activeColor,
                        isActive: activeIndex == 5,
                        onTap: () => _navigateTo(context, const InspiringFiguresPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.groups,
                        title: 'Demography',
                        activeColor: activeColor,
                        isActive: activeIndex == 6,
                        onTap: () => _navigateTo(context, const DemographyPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.info,
                        title: 'About Us',
                        activeColor: activeColor,
                        isActive: activeIndex == 7,
                        onTap: () => _navigateTo(context, const AboutUsPage()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // --- APPBAR (BAGIAN ATAS) ---
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: themeColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo-tanpa-teks.png',
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: navyColor, size: 35),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // --- ISI HALAMAN ---
        body: body,

        // --- BOTTOM NAVIGATION BAR ---
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            color: themeColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomItem(
                context: context,
                icon: Icons.home,
                label: "Home",
                activeColor: activeColor,
                isActive: activeIndex == 0,
                onTap: () {
                  if (activeIndex == 0) return; // Jika sudah di Home, abaikan klik

                  _forceGoToHome(context);
                },
              ),
              _buildBottomItem(
                context: context,
                icon: Icons.groups,
                label: "Demography",
                activeColor: activeColor,
                isActive: activeIndex == 6,
                onTap: () {
                  if (activeIndex == 6) return; // Cegah reload jika sudah aktif

                  // Gunakan pushReplacement agar tumpukan bersih
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => const DemographyPage()),
                  );
                },
              ),
              _buildBottomItem(
                context: context,
                icon: Icons.info,
                label: "About Us",
                activeColor: activeColor,
                isActive: activeIndex == 7,
                onTap: () {
                  if (activeIndex == 7) return; // Cegah reload jika sudah aktif

                  // Gunakan pushReplacement agar tumpukan bersih
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => const AboutUsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER UNTUK DRAWER ITEM ---
  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color activeColor,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    const Color navyColor = Color(0xFF012B47);

    return ListTile(
      leading: Icon(icon, color: isActive ? activeColor : navyColor),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? activeColor : navyColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: activeColor.withValues(alpha: 0.1),
      onTap: onTap,
    );
  }

  // --- WIDGET HELPER UNTUK BOTTOM NAV ITEM ---
  Widget _buildBottomItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color activeColor,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    const Color navyColor = Color(0xFF012B47);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? activeColor : navyColor,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : navyColor,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}