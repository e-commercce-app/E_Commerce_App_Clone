class ProductShoesHomePage {
  ProductShoesHomePage({
    this.productImage,
    this.productName,
    this.productPrice,
  });

  // ! FromJson / From Map
  factory ProductShoesHomePage.fromJson(Map<String, dynamic> map) {
    return ProductShoesHomePage(
      productImage: map['productImage'] as String?,
      productName: map['productName'] as String?,
      productPrice: map['productPrice'] as num?,
    );
  }
  String? productImage;
  String? productName;
  num? productPrice;

  // ! ToJson / ToMap
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
