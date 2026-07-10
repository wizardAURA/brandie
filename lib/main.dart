import 'package:brandie/features/smart_post/smart_post.dart';
import 'package:brandie/features/smart_post/viewmodels/smart_post_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/theme/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SmartPostViewmodel()),
      ],
      child: MaterialApp(
        title: 'Oriflame',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SmartShare(),
      ),
    );
  }
}