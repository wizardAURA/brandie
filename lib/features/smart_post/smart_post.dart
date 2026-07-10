import 'package:brandie/features/smart_post/viewmodels/smart_post_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/app_bar.dart';
import '../../core/widgets/bottom_app_bar.dart';
import 'components/post_overlays.dart';

import 'components/animations/vertical_page_indicator.dart';

class SmartShare extends StatefulWidget {
  const SmartShare({super.key});

  @override
  State<SmartShare> createState() => _SmartShareState();
}

class _SmartShareState extends State<SmartShare> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SmartPostViewmodel>().onPageChanged(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SmartPostViewmodel>();
    final posts = viewModel.posts;

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              onPageChanged: viewModel.onPageChanged,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [

                    Image.asset(
                      post.backgroundImageUrl,
                      fit: BoxFit.cover,
                    ),


                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),


                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius:26,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xFFF58599),
                                          Color(0xFFC491DB),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.auto_awesome, color: Colors.white, size: 14),
                                        SizedBox(width: 4),
                                        Text(
                                          'Ready to share',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'High-converting in Oriflame Community',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${index + 1} of ${posts.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Positioned(
                      right: 16,
                      bottom: 400,
                      child: VerticalPageIndicator(
                        itemCount: posts.length,
                        currentIndex: index,
                      ),
                    ),
                    PostOverlay(post: post),
                  ],
                );
              },
            ),
          ),
          const BottomNavBar(),
        ],
      ),
    );
  }
}