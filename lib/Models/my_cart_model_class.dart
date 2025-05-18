class MyCartModelClass {
  MyCartModelClass({
    this.productUid,
    this.productImage,
    this.productName,
    this.fullPrice,
    this.quantity,
  });

  factory MyCartModelClass.fromJson(Map<String, dynamic> map) {
    return MyCartModelClass(
      productUid: map['productUid'] as String?,
      productImage: map['productImage'] as String?,
      productName: map['productName'] as String?,
      fullPrice: map['fullPrice'] as num?,
      quantity: map['quantity'] as int?,
    );
  }
  String? productUid;
  String? productImage;
  String? productName;
  num? fullPrice;
  int? quantity;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productUid'] = productUid;
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['fullPrice'] = fullPrice;
    data['quantity'] = quantity;
    return data;
  }
}
