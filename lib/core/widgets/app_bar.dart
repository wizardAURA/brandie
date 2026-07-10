import 'package:flutter/material.dart';
import '../constants/theme/app_Colours.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,


      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/Assistant.png',
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Your Assistant',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Center_logo.png',
                    height: 32,
                    width: 117,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/camera.png',
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Camera',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTab('Smart Post', isActive: true),
                  _buildTab('Library'),
                  _buildTab('Communities'),
                  _buildTab('Share&Win'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, {bool isActive = false}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.primaryGreen : Colors.grey.shade600,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 40,
            color: AppColors.primaryGreen,
          ),
      ],
    );
  }
}