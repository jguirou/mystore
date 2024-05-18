import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mystore/utils/formatters/formatter.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
     this.parentId = '',
    required this.isFeatured,

  });

   String id;
  String name;
  String image;
   String parentId;
   bool isFeatured;




   
  /// Empty helper function
  static CategoryModel empty () => CategoryModel(id: '', name: '', image: '', parentId: '', isFeatured: false);
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      parentId: json['parentId'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    if (document.data != null) {
      final data = document.data()!;

      return CategoryModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );

    } else {
      return CategoryModel.empty();
    }

  }
}
