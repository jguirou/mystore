import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mystore/domain/entities/brands/brand_model.dart';
import 'package:mystore/domain/entities/products/product_attribute_model.dart';
import 'package:mystore/domain/entities/products/product_variation_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    this.description,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.sku,
    this.categoryId,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.isFeatured,
    this.productAttributes,
    this.productVariations,
    required this.productType,
  });

  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  String? description;
  BrandModel? brand;
  List<String>? images;
  String? categoryId;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  String productType;

  /// Empty helper function
  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    stock: 0,
    price: 0,
    thumbnail: '',
    productType: '',
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      productAttributes: (json['productAttributes'] as List<dynamic>?)?.map((e) => ProductAttributeModel.fromJson(e)).toList() ?? [],
      productVariations: (json['productVariations'] as List<dynamic>?)?.map((e) => ProductVariationModel.fromJson(e)).toList() ?? [],
      description: json['description'] ?? '',
      brand: json['brand'] is String ? null : BrandModel.fromJson(json['brand']),
      images: List<String>.from(json['images'] ?? []) ,
      salePrice: json['salePrice'] ?? 0.0, // Convert string to double
      sku: json['sku'] ?? '',
      categoryId: json['categoryId'] ?? '',
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0.0, // Convert string to double
      thumbnail: json['thumbnail'] ?? '',
      productType: json['productType'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['title'] ?? '',
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List<dynamic>?)?.map((e) => ProductAttributeModel.fromJson(e)).toList() ?? [],
      productVariations: (data['productVariations'] as List<dynamic>?)?.map((e) => ProductVariationModel.fromJson(e)).toList() ?? [],
      description: data['description'] ?? '',
      brand: data['brand'] is String ? null : BrandModel.fromJson(data['brand']),
      images: (data['images'] as List?)?.map((e) => e as String).toList() ?? [],
      salePrice: data['salePrice'] ?? 0.0, // Convert string to double
      sku: data['sku'] ?? '',
      stock: data['stock'] ?? 0,
      categoryId: data['categoryId'] ?? '',
      price: data['price'] ?? 0.0, // Convert string to double
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'title': title,
      'description': description,
      'brand': brand!.toJson(),
      'images': images ?? [],
      'salePrice': salePrice, // Convert double to String
      'stock': stock,
      'categoryId': categoryId,
      'price': price, // Convert double to String
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'productAttributes': productAttributes?.map((e) => e.toJson()).toList(),
      'productVariations': productVariations?.map((e) => e.toJson()).toList(),
      'productType': productType,
    };
  }




  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      title: data['title'] ?? '',
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List?)
          ?.map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      description: data['description'] ?? '',
      brand: data['brand'] != null ? BrandModel.fromJson(data['brand']) : null,
      images: (data['images'] as List?)?.map((e) => e as String).toList() ?? [],
      salePrice: (data['salePrice'] as num?)?.toDouble() ?? 0.0,
      sku: data['sku'] ?? '',
      stock: data['stock'] ?? 0,
      categoryId: data['categoryId'] ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
