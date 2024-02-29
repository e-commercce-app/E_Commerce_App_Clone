class MyCartModelClass {
  String? productUid;
  String? productImage;
  String? productName;
  num? productPrice;

  MyCartModelClass(
      {this.productUid,
      this.productImage,
      this.productName,
      this.productPrice});

  factory MyCartModelClass.fromJson(Map<String, dynamic> map) {
    return MyCartModelClass(
      productUid: map["productUid"],
      productImage: map["productImage"],
      productName: map["productName"],
      productPrice: map["productPrice"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['productUid'] = productUid;
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
