class FavorIteItemModelClass {
  FavorIteItemModelClass(
      {this.favoriteID,
      this.favoriteImageUrl,
      this.favoriteName,
      this.favoritePrice});

  factory FavorIteItemModelClass.fromJson(Map<String, dynamic> map) {
    return FavorIteItemModelClass(
      favoriteID: map['favoriteID'] as String?,
      favoriteImageUrl: map['favoriteImageUrl'] as String?,
      favoriteName: map['favoriteName'] as String?,
      favoritePrice: map['favoritePrice'] as num?,
    );
  }
  String? favoriteID;
  String? favoriteImageUrl;
  String? favoriteName;
  num? favoritePrice;

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['favoriteID'] = favoriteID;
    data['favoriteImageUrl'] = favoriteImageUrl;
    data['favoriteName'] = favoriteName;
    data['favoritePrice'] = favoritePrice;
    return data;
  }
}
