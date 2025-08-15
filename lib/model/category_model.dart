import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
   String id;
   String name;
   String image;
   String parentId;
   bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    this.isFeatured = false,
  });

  /// Empty Category instance
  factory CategoryModel.empty() {
    return CategoryModel(
      id: '',
      name: '',
      image: '',
      parentId: '',
      isFeatured: false,
    );
  }

  /// Convert model to Json for Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  /// Create model from Firestore DocumentSnapshot
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data == null) return CategoryModel.empty();

    return CategoryModel(
      id: document.id,
      name: data['name'] as String? ?? '',
      image: data['image'] as String? ?? '',
      parentId: data['parentId'] as String? ?? '',
      isFeatured: data['isFeatured'] as bool? ?? false,
    );
  }
}
