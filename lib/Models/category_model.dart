// ignore_for_file: file_names

class CategoriesModel {
  CategoriesModel({
    required this.categoryId,
    required this.categoryImg,
    required this.categoryName,
    required this.createdAt,
  });

  // Create a UserModel instance from a JSON map
  factory CategoriesModel.fromMap(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryId: json['categoryId'] as String,
      categoryImg: json['categoryImg'] as String,
      categoryName: json['categoryName'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  final String categoryId;
  final String categoryImg;
  final String categoryName;
  final dynamic createdAt;

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryImg': categoryImg,
      'categoryName': categoryName,
      'createdAt': createdAt,
    };
  }
}
