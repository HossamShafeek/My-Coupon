import 'package:equatable/equatable.dart';

class CouponModel extends Equatable{
  final String title;
  final String companyName;
  final String storeUrl;
  final String imageUrl;
  final String categoryName;
  final String expirationDate;
  final String description;
  final String code;
  final String userId;
  final String id;

  const CouponModel( {
    required this.companyName,
    required this.title,
    required this.storeUrl,
    required this.imageUrl,
    required this.categoryName,
    required this.expirationDate,
    required this.description,
    required this.code,
    required this.userId,
    required this.id,
  });

  factory CouponModel.fromJson(Map<String,dynamic>json){
    return CouponModel(
      companyName: json['company_name'],
      title: json['title'],
      storeUrl: json['store_url'],
      imageUrl: json['image_url'],
      categoryName: json['category_name'],
      expirationDate: json['expiration_date'],
      description: json['description'],
      code: json['code'],
      userId: json['user_id'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'company_name': companyName,
    'store_url': storeUrl,
    'image_url': imageUrl,
    'category_name': categoryName,
    'expiration_date': expirationDate,
    'description': description,
    'code': code,
    'user_id': userId,
    'id': id,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    companyName,
    storeUrl,
    imageUrl,
    categoryName,
    expirationDate,
    description,
    code,
    userId,
    id,
  ];


}
