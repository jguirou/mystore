import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  ProductCategoryModel({
    required this.brandId,
    required this.categoryId,


  });

  String brandId;
  String categoryId;






  /// Empty helper function
  static ProductCategoryModel empty () => ProductCategoryModel(brandId: '', categoryId: '', );
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
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

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;

    return ProductCategoryModel(
      brandId: data['brandId'] ?? '',
      categoryId: data['categoryId'] ?? '',

    );


  }
}