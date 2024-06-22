import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,


  });

  String brandId;
  String categoryId;






  /// Empty helper function
  static BrandCategoryModel empty () => BrandCategoryModel(brandId: '', categoryId: '', );
  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) {
    return BrandCategoryModel(
      brandId: json['brandId'] ?? '',
      categoryId: json['categoryId'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,

    };
  }

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;

    return BrandCategoryModel(
      brandId: data['brandId'] ?? '',
      categoryId: data['categoryId'] ?? '',

    );


  }
}