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

PostModel copyWith({
  String? caption,

}) {
  return PostModel(
    id: this.id,
    backgroundImageUrl: this.backgroundImageUrl,
    productName: this.productName,
    price: this.price,
    discountText: this.discountText,
    songTitle: this.songTitle,
    referralCode: this.referralCode,
    referralLink: this.referralLink,
    caption: caption ?? this.caption,
  );
}
}