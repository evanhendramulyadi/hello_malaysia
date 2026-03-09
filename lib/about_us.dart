import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna background yang konsisten
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 7, // <--- INI BIAR NYALA DI MENU ABOUT US
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              const SizedBox(height: 20),

              Image.asset(  
                'assets/images/pplg.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/accounting.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/culinery-student.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/dkv.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/hospy.png',
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