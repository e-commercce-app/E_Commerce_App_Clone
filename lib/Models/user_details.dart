class UserDetails {
  String? id;
  String? name;
  String? emailAddress;
  String? password;
  String? phoneNumber;
  bool? isAdmin;

  //! Constructor
  UserDetails({
    this.id,
    this.name,
    this.emailAddress,
    this.password,
    this.phoneNumber,
    this.isAdmin = false,
  });

  //! From Json / From Map
  factory UserDetails.fromJson(Map<String, dynamic> map) {
    return UserDetails(
        id: map['id'] as String,
        name: map["name"] as String,
        emailAddress: map["emailAddress"] as String,
        password: map["password"] as String,
        phoneNumber: map["phoneNumber"] as String,
        isAdmin: map["isAdmin"] as bool);
  }

  //! ToJson / ToMap
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["emailAddress"] = emailAddress;
    data["password"] = password;
    data["phoneNumber"] = phoneNumber;
    data["isAdmin"] = isAdmin;
    return data;
  }
}
