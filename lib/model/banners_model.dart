// import 'package:cloud_firestore/cloud_firestore.dart';

// class BannerModel {
//    String imageUrl;
//    String targetScreen;
//    bool active;

//   BannerModel({
//     required this.imageUrl,
//     required this.targetScreen,
//     required this.active,
//   });

//   /// Empty instance
//   static BannerModel empty() =>
//       BannerModel(imageUrl: '', targetScreen: '', active: false);

//   /// Convert to JSON (for Firestore or API)
//   Map<String, dynamic> toJson() {
//     return {
//       'imageUrl': imageUrl,
//       'targetScreen': targetScreen,
//       'active': active,
//     };
//   }

//   /// Create model from JSON map
//   factory BannerModel.fromJson(Map<String, dynamic> data) {
//     return BannerModel(
//       imageUrl: data['imageUrl'] ?? '',
//       targetScreen: data['targetScreen'] ?? '',
//       active: data['active'] is bool ? data['active'] : false,
//     );
//   }

//   /// Create model from Firestore document
//   factory BannerModel.fromDocument(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//   ) {
//     final data = snapshot.data();
//     if (data == null) return BannerModel.empty();
//     return BannerModel.fromJson(data);
//   }
// }


// 📂 banners_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
   String id; // 🔹 Unique ID for comparison
  String imageUrl;
   String targetScreen;
   bool active;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() => BannerModel(
        id: '',
        imageUrl: '',
        targetScreen: '',
        active: false,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data != null) {
      return BannerModel(
        id: data['id'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        targetScreen: data['targetScreen'] ?? '',
        active: data['active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
