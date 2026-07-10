import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/post_model.dart';
import '../viewmodels/smart_post_viewModel.dart';


class EditCaptionPage extends StatefulWidget {
  final PostModel post;

  const EditCaptionPage({super.key, required this.post});

  @override
  State<EditCaptionPage> createState() => _EditCaptionPageState();
}

class _EditCaptionPageState extends State<EditCaptionPage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    final fullText = '${widget.post.caption}\n\nUse my referral link: ${widget.post.referralLink}\nUse my referral code: ${widget.post.referralCode}';
    _textController = TextEditingController(text: fullText);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.black, size: 28),
                  ),

                  // Title
                  const Text(
                    'Edit Caption',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  GestureDetector(
                    onTap: () {
                      context.read<SmartPostViewmodel>().updatePostCaption(
                        widget.post.id,
                        _textController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8E6C9), // Light green matching Figma
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Text Editor Area ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    height: 1.5,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a caption...',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}