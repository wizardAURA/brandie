import 'package:flutter/material.dart';

import '../../../core/constants/theme/app_Colours.dart';

class SocialShareRow extends StatelessWidget {
  const SocialShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Quick share to: ', style: TextStyle(color: AppColors.textLight, fontSize: 13)),
        const SizedBox(width: 8),
        _buildSocialIcon('assets/images/Instagram.png'),
        _buildSocialIcon('assets/images/Facebook.png'),
        _buildSocialIcon('assets/images/messenger.png'),
        _buildSocialIcon('assets/images/Tik Tok.png'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.white24,
        child: Image.asset(
          assetPath,
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}