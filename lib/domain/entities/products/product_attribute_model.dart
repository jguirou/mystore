
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAttributeModel {
  ProductAttributeModel({
    required this.name,
    required this.values,


  });

  String name;
  List<String> values;







  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeModel(
      name: json['name'] ?? '',
      values: json['values'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,

    };
  }

  factory ProductAttributeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;

    return ProductAttributeModel(
      name: data['name'] ?? '',
      values: data['values'] ?? '',

    );


  }
}