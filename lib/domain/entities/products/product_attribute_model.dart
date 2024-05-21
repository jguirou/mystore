
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAttributeModel {
  ProductAttributeModel({
     this.name,
     this.values,


  });

  String? name;
  final List<String>? values;







  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('name') ? data['name'] : '',
      values: List<String>.from(data['values']),

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