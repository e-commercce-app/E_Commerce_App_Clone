class ProductShoesHomePage {
  String? productImage;
  String? productName;
  num? productPrice;

  ProductShoesHomePage(
      {this.productImage, this.productName, this.productPrice});

  // ! FromJson / From Map
  factory ProductShoesHomePage.fromJson(Map<String, dynamic> map) {
    return ProductShoesHomePage(
      productImage: map["productImage"],
      productName: map["productName"],
      productPrice: map["productPrice"],
    );
  }

  // ! ToJson / ToMap
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["productImage"] = productImage;
    data["productName"] = productName;
    data["productPrice"] = productPrice;
    return data;
  }
}
