class ProductShoesHomePageModel {
  ProductShoesHomePageModel({
    this.productImage,
    this.productName,
    this.fullPrice,
    this.salePrice,
    this.isSale,
    this.categoryId,
  });

  // ! FromJson / From Map
  factory ProductShoesHomePageModel.fromJson(Map<String, dynamic> map) {
    return ProductShoesHomePageModel(
      productImage: map['productImage'] as String?,
      productName: map['productName'] as String?,
      fullPrice: map['fullPrice'] as num?,
      salePrice: map['salePrice']?.toString(),
      isSale: map['isSale'] as bool?,
      categoryId: map['categoryId'] as String?,
    );
  }
  String? productImage;
  String? productName;
  num? fullPrice;
  String? salePrice;
  bool? isSale;
  String? categoryId;
  // ! ToJson / ToMap
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['fullPrice'] = fullPrice;
    data['salePrice'] = salePrice;
    data['isSale'] = isSale;
    data['categoryId'] = categoryId;
    return data;
  }
}
