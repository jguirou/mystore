
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
     this.productsCount,
     this.isFeatured,

  });

  String id;
  String name;
  String image;
  int? productsCount;

  bool? isFeatured;





  /// Empty helper function
  static BrandModel empty () => BrandModel(id: '', name: '', productsCount: 0, image: '', isFeatured: false);
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      productsCount: json['productsCount'] is int ? json['productsCount'] : int.tryParse(json['productsCount'].toString()) ?? 0,

      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
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
      productsCount: data['productsCount'] is int ? data['productsCount'] : int.tryParse(data['productsCount'].toString()) ?? 0,

      isFeatured: data['isFeatured'] ?? false,
    );


  }
}
