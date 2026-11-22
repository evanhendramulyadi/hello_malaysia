import 'package:flutter/material.dart';

// Import all pages so Navigator recognizes navigation targets
import '../culture_page.dart';
import '../geography.dart';
import '../inspiring_figures.dart';
import '../tourism.dart';
import '../culinary.dart';
import '../demography.dart';
import '../about_us.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;

  /// Indicator of currently active page:
  /// 0: Home, 1: Culture, 2: Tourism, 3: Geography, 4: Culinary
  /// 5: Inspiring Figures, 6: Demography, 7: About Us
  final int activeIndex;

  const CustomLayout({super.key, required this.body, this.activeIndex = 0});

  // Helper method to completely reset navigation state and return to initial Home page
  void _forceGoToHome(BuildContext context) {
    // Clear all existing route history and cleanly launch root '/' (Home)
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  // Method to navigate to a page from Drawer and automatically close drawer
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context);

    // Use pushReplacement to keep RAM clean and prevent stacking in the background
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    // Define branding colors
    const Color themeColor = Color(0xFFF8F0E5);
    const Color navyColor = Color(0xFF012B47);
    const Color activeColor = Colors.blue;

    // WRAP WITH POPSCOPE TO RESOLVE DEVICE BACK BUTTON BEHAVIOR
    return PopScope(
      canPop:
          activeIndex ==
          0, // Only allow exiting the app if currently on HOME
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // IF ON ANOTHER PAGE, WHEN BACK IS PRESSED: Force return to Home without closing the app
        if (activeIndex != 0) {
          _forceGoToHome(context);
        }
      },
      child: Scaffold(
        backgroundColor: themeColor,

        // --- DRAWER (SIDE MENU) ---
        endDrawer: Drawer(
          child: Container(
            color: themeColor,
            child: Column(
              children: [
                // Drawer Header with Logo
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: const BoxDecoration(color: navyColor),
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo-white-text.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Menu List in Drawer
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
                        onTap: () =>
                            _navigateTo(context, const GeographyPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.restaurant,
                        title: 'Culinary',
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
                        onTap: () =>
                            _navigateTo(context, const InspiringFiguresPage()),
                      ),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.groups,
                        title: 'Demography',
                        activeColor: activeColor,
                        isActive: activeIndex == 6,
                        onTap: () =>
                            _navigateTo(context, const DemographyPage()),
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

        // --- APPBAR (TOP BAR) ---
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
                    'assets/images/logo-no-text.png',
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

        // --- PAGE CONTENT ---
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
                  if (activeIndex == 0) {
                    return; // If already on Home, ignore click
                  }

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
                  if (activeIndex == 6) {
                    return; // Prevent reload if already active
                  }

                  // Use pushReplacement to keep navigation stack clean
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DemographyPage(),
                    ),
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
                  if (activeIndex == 7) {
                    return; // Prevent reload if already active
                  }

                  // Use pushReplacement to keep navigation stack clean
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGET FOR DRAWER ITEM ---
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

  // --- HELPER WIDGET FOR BOTTOM NAV ITEM ---
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
          Icon(icon, color: isActive ? activeColor : navyColor, size: 28),
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
