import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
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
                'assets/images/itenerary-trip.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/in-ex-breakdown-harga.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              // Jarak penutup di bawah (bisa lo isi konten lain nanti)
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}