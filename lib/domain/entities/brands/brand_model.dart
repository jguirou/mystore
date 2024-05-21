
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
     this.productsCount,
    this.parentId = '',
    required this.isFeatured,

  });

  String id;
  String name;
  String image;
  int? productsCount;
  String parentId;
  bool isFeatured;





  /// Empty helper function
  static BrandModel empty () => BrandModel(id: '', name: '', productsCount: 0, image: '', parentId: '', isFeatured: false);
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      parentId: json['parentId'] ?? '',
      productsCount: json['productsCount'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parentId': parentId,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;

    return BrandModel(
      id: document.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      parentId: data['parentId'] ?? '',
      productsCount: data['productsCount'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
    );


  }
}
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