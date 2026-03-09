import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class CulineryPage extends StatelessWidget {
  const CulineryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna background krem yang konsisten
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 4, // <--- INI BIAR NYALA DI MENU KULINER
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/culinery.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/nasi-lemak-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/nasi-lemak-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/nasi-lemak-3.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/nasi-lemak-4.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/satay-ayam-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/satay-ayam-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/satay-ayam-3.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/satay-ayam-4.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/teh-tarik-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/teh-tarik-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/teh-tarik-3.png',
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