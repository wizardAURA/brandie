import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../components/socials_row.dart';
import 'animations/animated_product_card.dart';

class PostOverlay extends StatelessWidget {
  final PostModel post;

  const PostOverlay({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AnimatedProductCard(post: post),
          const SizedBox(height: 12),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.music_note, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      children: [
                        const TextSpan(text: 'RECOMMENDED: '),
                        TextSpan(
                          text: post.songTitle.split(' by ').first,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                        TextSpan(text: ' by ${post.songTitle.split(' by ').last}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),


          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2), // Simple transparency
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.auto_awesome, color: Colors.white, size: 14),
                        SizedBox(width: 6),
                        Text(
                          'CAPTION SUGGESTION',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.edit, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Edit Caption',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
                    children: [
                      TextSpan(text: post.caption),
                      const TextSpan(
                        text: ' see more',
                        style: TextStyle(fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                Text(
                  'Use my referral code: ${post.referralCode}',
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 2),
                Text(
                  'Use my referral link: ${post.referralLink}',
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 4. Social Share Row
          const SocialShareRow(),
        ],
      ),
    );
  }
}