import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});

  @override
  State<TourismPage> createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  // Variabel penanda status dropdown
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 2,
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

              // --- LOGIKA DROUPDOWN ITINERARY ---
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Image.asset(
                  isExpanded
                      ? 'assets/images/itenerary-trip-2.png'
                      : 'assets/images/itenerary-trip-1.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),

              // Munculkan trip 3 & 4 jika statusnya expanded
              if (isExpanded) ...[
                const SizedBox(height: 25),
                Image.asset(
                  'assets/images/itenerary-trip-3.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 5),
                Image.asset(
                  'assets/images/itenerary-trip-4.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ],

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/in-ex.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),
              
              Image.asset(
                'assets/images/price-breakdown.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              // Jarak penutup di bawah
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}