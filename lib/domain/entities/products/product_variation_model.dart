import 'package:cloud_firestore/cloud_firestore.dart';

class ProductVariationModel {
  ProductVariationModel({
    required this.id,
    this.sku= '',
     this.image = '',
    this.description = '',
     this.stock = 0,
     this.price = 0.0,
     this.salePrice = 0.0,
    required this.attributesValues,
  });

  final String id;
  String sku;
  int stock;
  double price;
  double? salePrice;
  String image;
  String? description;

  Map<String, String> attributesValues;

  /// Empty helper function
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributesValues: {},

      );

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['id'] ?? '',
      sku: json['sku'],
      attributesValues:
          Map<String, String>.from(json['attributesValues'] ?? []),
      image: json['images'] ?? [],
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0.0,
      salePrice: json['salePrice'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'attributesValues': attributesValues,
      'images': image,
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
      sku: data['sku'] ?? '',
      attributesValues: data['attributesValues'] ?? [],
      image: data['images'] ?? [],
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
    );
  }
}
