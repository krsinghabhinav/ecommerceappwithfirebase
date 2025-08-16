import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  int productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured = false,
    this.productsCount = 0,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert Model to Json/Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productCount': productsCount,
    };
  }

  /// Create BrandModel from JSON Map
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
      productsCount: json['productCount'] ?? 0,
    );
  }

  /// Create BrandModel from Firestore Document
  factory BrandModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (!document.exists || document.data() == null) {
      return BrandModel.empty();
    }
    final data = document.data()!;
    return BrandModel(
      id: data['id'] ?? '',
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productsCount: data['productCount'] ?? 0,
    );
  }
}
