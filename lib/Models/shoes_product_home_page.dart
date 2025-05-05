class ProductShoesHomePageModel {
  ProductShoesHomePageModel({
    this.productImage,
    this.productName,
    this.fullPrice,
    this.salePrice,
    this.isSale,
  });

  // ! FromJson / From Map
  factory ProductShoesHomePageModel.fromJson(Map<String, dynamic> map) {
    return ProductShoesHomePageModel(
      productImage: map['productImage'] as String?,
      productName: map['productName'] as String?,
      fullPrice: map['fullPrice'] as num?,
      salePrice: map['salePrice']?.toString(),
      isSale: map['isSale'] as bool?,
    );
  }
  String? productImage;
  String? productName;
  num? fullPrice;
  String? salePrice;
  bool? isSale;
  // ! ToJson / ToMap
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['fullPrice'] = fullPrice;
    data['salePrice'] = salePrice;
    data['isSale'] = isSale;
    return data;
  }
}
