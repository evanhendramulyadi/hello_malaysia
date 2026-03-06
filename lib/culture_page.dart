import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna background yang konsisten
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
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

              const SizedBox(height: 25), // Tadi lo kurang koma di sini

              // 3. TRADITIONAL RELIGIOUS
              Image.asset(
                'assets/images/traditional-religious.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 30), // Pastikan diakhiri koma atau tutup bracket
            ],
          ),
        ),
      ),
    );
  }
}