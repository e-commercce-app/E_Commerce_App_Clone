class OrderModelClass {
  String? orderUid;
  String? orderLocation;
  String? orderName;
  String? orderEmail;
  String? orderPhone;

  OrderModelClass(
      {this.orderUid,
      this.orderLocation,
      this.orderName,
      this.orderEmail,
      this.orderPhone});

  factory OrderModelClass.fromJson(Map<String, dynamic> map) {
    return OrderModelClass(
        orderUid: map["orderUid"],
        orderLocation: map["orderLocation"],
        orderName: map["orderName"],
        orderEmail: map["orderEmail"],
        orderPhone: map["orderPhone"]);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["orderUid"] = orderUid;
    data["orderLocation"] = orderLocation;
    data["orderName"] = orderName;
    data["orderEmail"] = orderEmail;
    data["orderPhone"] = orderPhone;
    return data;
  }
}
