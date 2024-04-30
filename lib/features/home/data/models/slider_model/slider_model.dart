class OfferModel {
  final String imageUlr;
  final String storeUrl;
  final String companyName;

  const OfferModel({required this.imageUlr, required this.storeUrl, required this.companyName});

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      imageUlr: json['image_url'],
      storeUrl: json['store_url'],
      companyName: json['company_name'],
    );
  }
}
