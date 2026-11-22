import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consistent background color
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 7, // <--- Highlight the About Us menu item
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/pplg-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/pplg-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/accounting-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/accounting-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/culinary-student-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/culinary-student-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/dkv-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/dkv-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/hospy-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/hospy-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(
                'assets/images/background.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              Image.asset(
                'assets/images/goal.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              Image.asset(
                'assets/images/logo-philosophy.png',
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
