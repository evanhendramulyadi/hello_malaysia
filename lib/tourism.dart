import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 2, // <--- BIAR NYALA DI DRAWER (Urutan ketiga)
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. Gambar Utama Malaysia Gateway
              Image.asset(
                'assets/images/malaysia-gateway.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/destinations-highlights-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/destinations-highlights-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/destinations-highlights-3.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/destinations-highlights-4.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/itenerary-trip-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/itenerary-trip-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/breakdown-harga.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              // Jarak penutup di bawah
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}