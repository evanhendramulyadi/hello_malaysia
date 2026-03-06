import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class GeographyPage extends StatelessWidget {
  const GeographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kremColor = Color(0xFFF8F0E5);
 
    return CustomLayout(
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. Natural Geography
              Image.asset(
                'assets/images/natural-geography.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 2. Territorial Boundaries
              Image.asset(
                'assets/images/territorial-boundaries.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 3. Geographical Location
              Image.asset(
                'assets/images/geographical-location.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 4. Landforms 1
              Image.asset(
                'assets/images/landforms-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              // 5. Landforms 2
              Image.asset(
                'assets/images/landforms-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              // Penutup
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}