import 'package:flutter/material.dart';
import 'widgets/custom_layout.dart';

class DemographyPage extends StatelessWidget {
  const DemographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna background yang konsisten
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 6, // <--- BIAR NYALA DI MENU DEMOGRAPHY
      body: Container(
        color: kremColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              const SizedBox(height: 20),

              Image.asset(  
                'assets/images/nation-of-diversity.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/ethnic-heritage.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/religious-nation-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/religious-nation-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset(  
                'assets/images/voices-nation.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/value-nation.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/malaysian-map.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/occupations-malaysia-1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/occupations-malaysia-2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/occupations-malaysia-3.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              const SizedBox(height: 25),

              Image.asset( 
                'assets/images/occupations-malaysia-4.png',
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