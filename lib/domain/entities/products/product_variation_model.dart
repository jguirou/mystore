import 'package:cloud_firestore/cloud_firestore.dart';

class ProductVariationModel {
  ProductVariationModel({
    required this.id,
    required this.images,
    required this.stock,
    required this.price,
     this.salePrice,
    required this.attributesValues,
  });

  String id;
  int stock;
  double price;
  double? salePrice;
  String images;

  Map<String, String> attributesValues;

  /// Empty helper function
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributesValues: {'Color': '', 'Size': ''},
        images: '',
        stock: 0,
        salePrice: 0,
        price: 0,
      );

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['id'] ?? '',
      attributesValues:
          Map<String, String>.from(json['attributesValues'] ?? []),
      images: json['images'] ?? [],
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0,
      salePrice: json['salePrice'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attributesValues': attributesValues,
      'images': images,
      'stock': stock,
      'price': price,
      'salePrice': salePrice,
    };
  }

  factory ProductVariationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductVariationModel(
      id: document.id,
      attributesValues: data['attributesValues'] ?? [],
      images: data['images'] ?? [],
      stock: data['stock'] ?? 0,
      price: data['price'] ?? 0,
      salePrice: data['salePrice'] ?? 0,
    );
  }
}
