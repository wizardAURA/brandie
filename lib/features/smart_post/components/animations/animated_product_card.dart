import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/theme/app_Colours.dart';
import '../../model/post_model.dart';
import '../../viewmodels/smart_post_viewModel.dart';


class AnimatedProductCard extends StatelessWidget {
  final PostModel post;

  const AnimatedProductCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<SmartPostViewmodel>().isProductCardVisible;

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child: AnimatedSlide(
        offset: isVisible ? Offset.zero : const Offset(0, 0.2),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Opening personal beauty store...')),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 48,
                    width: 48,
                    color: Colors.red[100],
                    child: Image.asset('assets/images/Lipstick.png'),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text('\$${post.price}', style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textDark)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.discountGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            post.discountText,
                            style: const TextStyle(color: AppColors.textLight, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}