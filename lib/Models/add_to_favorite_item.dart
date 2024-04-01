class FavorIteItemModelClass {
  String? favoriteID;
  String? favoriteImageUrl;
  String? favoriteName;
  num? favoritePrice;

  FavorIteItemModelClass(
      {this.favoriteID,
      this.favoriteImageUrl,
      this.favoriteName,
      this.favoritePrice});

  factory FavorIteItemModelClass.fromJson(Map<String, dynamic> map) {
    return FavorIteItemModelClass(
      favoriteID: map["favoriteID"],
      favoriteImageUrl: map["favoriteImageUrl"],
      favoriteName: map["favoriteName"],
      favoritePrice: map["favoritePrice"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["favoriteID"] = favoriteID;
    data["favoriteImageUrl"] = favoriteImageUrl;
    data["favoriteName"] = favoriteName;
    data["favoritePrice"] = favoritePrice;
    return data;
  }
}
