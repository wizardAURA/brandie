import 'package:flutter/material.dart';

import '../constants/theme/app_Colours.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundDark,
      
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.local_offer_outlined, color: AppColors.textLight),
              Icon(Icons.search, color: AppColors.textLight),
              Icon(Icons.home, color: AppColors.textLight, size: 32),
              Icon(Icons.chat_bubble_outline, color: AppColors.textLight),
              Icon(Icons.person_outline, color: AppColors.textLight),
            ],
          ),
        ),
      ),
    );
  }
}
