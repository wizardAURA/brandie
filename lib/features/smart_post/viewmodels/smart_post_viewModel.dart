import 'dart:async';
import 'package:brandie/features/smart_post/model/post_model.dart';
import 'package:flutter/material.dart';

class SmartPostViewmodel extends ChangeNotifier{
  bool isProductCardVisible = false;
  int currentIndex =0;
  Timer? animationTimer;

  final List<PostModel> posts = [
    PostModel(
      id: '1',
      backgroundImageUrl: 'assets/images/IMG_3191.png',
      productName: 'Giordani Gold Lipstick',
      price: 14.99,
      discountText: '30% off',
      songTitle: 'Bad Habits by Ed Sheeran',
      caption: '💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn\'t just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too.Pamper your lips with care while enjoying a long-lasting, luminous matte colour. 💋 ✨ #Oriflame #GiordaniGold #LipCareGoals.',
      referralCode: 'UK-AMANDA3012',
        referralLink: 'www.oriflame.com/giordani/amanda3012'
    ),
    PostModel(
      id: '2',
      backgroundImageUrl: 'assets/images/IMG_3191 (1).png',
      productName: 'Luminous Foundation',
      price: 24.99,
      discountText: '15% off',
      songTitle: 'Levitating by Dua Lipa',
      caption: '✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance',
      referralCode: 'UK-AMANDA3012',
        referralLink: 'www.oriflame.com/giordani/amanda3012'
    ),
  ];
  void onPageChanged(int index){
    currentIndex = index;
    resetAndStartTimer();
  }
  void resetAndStartTimer() {
    isProductCardVisible = false;
    notifyListeners();

    animationTimer?.cancel();
    animationTimer = Timer(const Duration(seconds: 3), () {
      isProductCardVisible = true;
      notifyListeners();
    });
  }
  @override
  void dispose() {
    animationTimer?.cancel();
    super.dispose();
  }
}
