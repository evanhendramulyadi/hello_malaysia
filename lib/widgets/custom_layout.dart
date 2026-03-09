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
  final int activeIndex;

  const CustomLayout({
    super.key,
    required this.body,
    this.activeIndex = 0,
  });

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Tutup drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Color(0xFFF8F0E5);
    const Color navyColor = Color(0xFF012B47);
    const Color activeColor = Colors.blue;

    return Scaffold(
      backgroundColor: themeColor,
      // Penting: agar body naik ke belakang AppBar yang rounded
      extendBodyBehindAppBar: true,

      // --- DRAWER (MENU SAMPING) ---
      endDrawer: Drawer(
        child: Container(
          color: themeColor,
          child: Column(
            children: [
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
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
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
                        Navigator.of(context).popUntil((route) => route.isFirst);
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo-tanpa-teks.png',
                    height: 50,
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
      ),

      // --- ISI HALAMAN ---
      body: body,

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        height: 85, // Sedikit lebih tinggi agar nyaman
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
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
              onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
            ),
            _buildBottomItem(
              context: context,
              icon: Icons.groups, // Pakai icon grup untuk Demography
              label: "Demography",
              activeColor: activeColor,
              isActive: activeIndex == 6,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DemographyPage())),
            ),
            _buildBottomItem(
              context: context,
              icon: Icons.info,
              label: "About Us",
              activeColor: activeColor,
              isActive: activeIndex == 7,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage())),
            ),
          ],
        ),
      ),
    );
  }

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