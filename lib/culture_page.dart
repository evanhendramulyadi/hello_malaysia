import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna background yang konsisten
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 1, // <--- INI BIAR NYALA DI DRAWER (Urutan kedua)
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. BANNER WELCOME
              Image.asset(
                'assets/images/culture.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25), 

              // 2. TAPESTRY CULTURES
              Image.asset(
                'assets/images/tapestry-cultures.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25), 

              // 3. TRADITIONAL RELIGIOUS
              Image.asset(
                'assets/images/traditional-religious-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 15),

              Image.asset(
                'assets/images/traditional-religious-2.png',
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