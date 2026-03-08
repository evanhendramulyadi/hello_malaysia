import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
              
              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }
}