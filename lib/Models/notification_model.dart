class NotificationModelClass {
  NotificationModelClass({
    this.notificationUid,
    this.notificationLocation,
    this.notificationName,
    this.notificationEmail,
    this.notificationPhone,
  });

  factory NotificationModelClass.fromJson(Map<String, dynamic> map) {
    return NotificationModelClass(
      notificationUid: map['notificationUid'] as String?,
      notificationLocation: map['notificationLocation'] as String?,
      notificationName: map['notificationName'] as String?,
      notificationEmail: map['notificationEmail'] as String?,
      notificationPhone: map['notificationPhone'] as String?,
    );
  }
  String? notificationUid;
  String? notificationLocation;
  String? notificationName;
  String? notificationEmail;
  String? notificationPhone;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notificationUid'] = notificationUid;
    data['notificationLocation'] = notificationLocation;
    data['notificationName'] = notificationName;
    data['notificationEmail'] = notificationEmail;
    data['notificationPhone'] = notificationPhone;
    return data;
  }
}
