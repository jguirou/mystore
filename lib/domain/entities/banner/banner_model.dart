

import 'package:cloud_firestore/cloud_firestore.dart';


class BannerModel {
  BannerModel({
    this.id,

    required this.imageUrl,
    required this.targetScreen,
    required this.active,

  });

  final String? id;
  String imageUrl;
  final String targetScreen;
  final bool active;





  /// Empty helper function
  static BannerModel empty () => BannerModel(id: '',imageUrl: '', targetScreen: '', active: false);
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      imageUrl: json['imageUrl'] ?? '',
      targetScreen: json['targetScreen'] ?? '',
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;

    return BannerModel(
      id: data['id'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      targetScreen: data['targetScreen'] ?? '',
      active: data['active'] ?? false,
    );

  
  }
}
