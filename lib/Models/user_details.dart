class UserDetails {
  String? id;
  String? name;
  String? emailAddress;
  String? userImage;
  bool? isAdmin;

  //! Constructor
  UserDetails(
      {this.id,
      this.name,
      this.emailAddress,
      this.userImage,
      this.isAdmin = false});

  //! From Json / From Map
  factory UserDetails.fromJson(Map<String, dynamic> map) {
    return UserDetails(
        id: map['id'] as String,
        name: map["name"] as String,
        emailAddress: map["emailAddress"] as String,
        userImage: map["userImage"] as String,
        isAdmin: map["isAdmin"] as bool);
  }

  //! ToJson / ToMap
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["emailAddress"] = emailAddress;
    data["userImage"] = userImage;
    data["isAdmin"] = isAdmin;
    return data;
  }
}
