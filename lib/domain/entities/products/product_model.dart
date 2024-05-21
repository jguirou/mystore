import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mystore/domain/entities/brands/brand_model.dart';
import 'package:mystore/domain/entities/products/product_attribute_model.dart';
import 'package:mystore/domain/entities/products/product_variation_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.images,
    required this.salePrice,
    required this.sku,
    required this.categoryId,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.isFeatured,
    required this.productAttributes,
     this.productVariations,
    required this.productType,
  });

  String id;
  String title;
  String description;
  BrandModel brand;
  List<String> images;
  int salePrice;
  String sku;
  String categoryId;
  int stock;
  int price;
  String thumbnail;
  bool isFeatured;
  List<ProductAttributeModel> productAttributes;
  List<ProductVariationModel>? productVariations;
  String productType;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      productAttributes:
          List<ProductAttributeModel>.from(json['productAttributes'] ?? {}),
      productVariations:
          List<ProductVariationModel>.from(json['productVariations'] ?? {}),
      description: json['description'] ?? '',
      brand: BrandModel.fromJson(json['brand'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      salePrice: json['salePrice'] ?? 0,
      sku: json['sku'] ?? '',
      categoryId: json['categoryId'] ?? '',
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      productType: json['productType'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'brand': brand.toJson(),
      'images': images,
      'salePrice': salePrice,
      'sku': sku,
      'stock': stock,
      'categoryId': categoryId,
      'price': price,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'productAttributes': productAttributes,
      'productVariations': productVariations,
      'productType': productType,
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      title: data['title'] ?? '',
      productType: data['productType'] ?? '',
      productAttributes:
          List<ProductAttributeModel>.from(data['productAttributes'] ?? {}),
      productVariations:
          List<ProductVariationModel>.from(data['productVariations'] ?? {}),
      description: data['description'] ?? '',
      brand: BrandModel.fromJson(data['brand'] ?? {}),
      images: List<String>.from(data['images'] ?? []),
      salePrice: data['salePrice'] ?? 0,
      sku: data['sku'] ?? '',
      stock: data['stock'] ?? 0,
      categoryId: data['categoryId'] ?? '',
      price: data['price'] ?? 0,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
