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
              // 1. BANNER WELCOME (Persis kayak di Main)
              Image.asset(
                'assets/images/culture.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              // 2. AREA KOSONG (Warna Krem)
              // Kita kasih SizedBox dengan height tinggi biar kelihatan "kosong" tapi bisa di-scroll
              const SizedBox(height: 1000), 
            ],
          ),
        ),
      ),
    );
  }
}