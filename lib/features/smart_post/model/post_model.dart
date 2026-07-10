class PostModel {
  final String id;
  final String backgroundImageUrl;
  final String productName;
  final double price;
  final String discountText;
  final String songTitle;
  final String caption;
  final String referralCode;
  final String referralLink;

  PostModel({
    required this.id,
    required this.backgroundImageUrl,
    required this.productName,
    required this.price,
    required this.discountText,
    required this.songTitle,
    required this.caption,
    required this.referralCode,
    required this.referralLink
  });
}