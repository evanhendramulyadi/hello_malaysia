import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class InspiringFiguresPage extends StatelessWidget {
  const InspiringFiguresPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consistent cream background color
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 5, // <--- Highlight the Inspiring Figures menu item
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 1. FIGURE PHOTO (Tun Abdul Razak)
              Image.asset(
                'assets/images/tun-abdul-razak.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 2. FIGURE PHOTO (Chef Wan)
              Image.asset(
                'assets/images/chef-wan.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 3. FIGURE PHOTO (Abdul Muid Latif)
              Image.asset(
                'assets/images/abdul-muid-latif.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 4. FIGURE PHOTO (Tony Fernandes)
              Image.asset(
                'assets/images/tony-fernandes.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 5. FIGURE PHOTO (Tunku Abdul Rahman)
              Image.asset(
                'assets/images/tunku-abdul-rahman.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
