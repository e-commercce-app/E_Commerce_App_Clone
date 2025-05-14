class OrderModelClass {
  OrderModelClass({
    this.orderUid,
    this.orderLocation,
    this.orderName,
    this.orderEmail,
    this.orderPhone,
    this.orderStatus,
    this.createdAt,
  });

  factory OrderModelClass.fromJson(Map<String, dynamic> map) {
    return OrderModelClass(
      orderUid: map['orderUid'] as String?,
      orderLocation: map['orderLocation'] as String?,
      orderName: map['orderName'] as String?,
      orderEmail: map['orderEmail'] as String?,
      orderPhone: map['orderPhone'] as String?,
      orderStatus: map['orderStatus'] as String?,
      createdAt: map['createdAt'] as String?,
    );
  }
  String? orderUid;
  String? orderLocation;
  String? orderName;
  String? orderEmail;
  String? orderPhone;
  String? orderStatus;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['orderUid'] = orderUid;
    data['orderLocation'] = orderLocation;
    data['orderName'] = orderName;
    data['orderEmail'] = orderEmail;
    data['orderPhone'] = orderPhone;
    data['orderStatus'] = orderStatus;
    data['createdAt'] = createdAt;
    return data;
  }
}
