class UserDetails {
  //! Constructor
  UserDetails({
    this.id,
    this.name,
    this.emailAddress,
    this.password,
    this.phoneNumber,
    this.createdOn,
    this.role = 'isUser', // Default 'isUser' role
    this.token,
    String? adminToken, // private field handle in constructor
  }) : adminToken = role == 'isAdmin' ? adminToken : null;

  //! From Json / From Map
  factory UserDetails.fromJson(Map<String, dynamic> map) {
    final role = map['role'] as String? ?? 'isUser';
    return UserDetails(
      id: map['id'] as String?,
      name: map['name'] as String?,
      emailAddress: map['emailAddress'] as String?,
      password: map['password'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      createdOn: map['createdOn'] as String?,
      role: role,
      token: map['token'] as String?,
      adminToken: role == 'isAdmin' ? map['adminToken'] as String? : null,
    );
  }

  //! Fields
  String? id;
  String? name;
  String? emailAddress;
  String? password;
  String? phoneNumber;
  String? role; // isUser, isAdmin, deliveryBoy, guest
  String? token;
  String? adminToken;
  String? createdOn;

  //! ToJson / ToMap
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'name': name,
      'emailAddress': emailAddress,
      'password': password,
      'phoneNumber': phoneNumber,
      'createdOn': createdOn,
      'role': role,
      'token': token,
    };
    if (role == 'isAdmin') {
      data['adminToken'] = adminToken;
    }
    return data;
  }

  //! copyWith Method
  UserDetails copyWith({
    String? id,
    String? name,
    String? emailAddress,
    String? password,
    String? phoneNumber,
    String? createdOn,
    String? role,
    String? token,
    String? adminToken,
  }) {
    final updatedRole = role ?? this.role;
    return UserDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdOn: createdOn ?? this.createdOn,
      role: updatedRole,
      token: token ?? this.token,
      adminToken:
          updatedRole == 'isAdmin' ? (adminToken ?? this.adminToken) : null,
    );
  }
}

// ignore_for_file: use_if_null_to_convert_nulls_to_bools

// class UserDetails {
//   //! Constructor
//   UserDetails({
//     this.id,
//     this.name,
//     this.emailAddress,
//     this.password,
//     this.phoneNumber,
//     this.isAdmin = false,
//     this.token,
//     this.adminToken, // New Field
//   }); // Admin ke liye extra field

//   //! From Json / From Map
//   factory UserDetails.fromJson(Map<String, dynamic> map) {
//     return UserDetails(
//       id: map['id'] as String?,
//       name: map['name'] as String?,
//       emailAddress: map['emailAddress'] as String?,
//       password: map['password'] as String?,
//       phoneNumber: map['phoneNumber'] as String?,
//       isAdmin: map['isAdmin'] as bool? ?? false,
//       token: map['token'] as String?,
//       adminToken:
//           (map['isAdmin'] == true) ? map['adminToken'] as String? : null,
//     );
//   }

//   //! Fields
//   String? id;
//   String? name;
//   String? emailAddress;
//   String? password;
//   String? phoneNumber;
//   bool? isAdmin;
//   String? token;
//   String? adminToken;

//   //! ToJson / ToMap
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['emailAddress'] = emailAddress;
//     data['password'] = password;
//     data['phoneNumber'] = phoneNumber;
//     data['isAdmin'] = isAdmin;
//     data['token'] = token;

//     // adminToken tabhi add karo jab isAdmin true ho
//     if (isAdmin == true) {
//       data['adminToken'] = adminToken;
//     }

//     return data;
//   }

//   //! `copyWith` Method
//   UserDetails copyWith({
//     String? id,
//     String? name,
//     String? emailAddress,
//     String? password,
//     String? phoneNumber,
//     bool? isAdmin,
//     String? token,
//     String? adminToken,
//   }) {
//     return UserDetails(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       emailAddress: emailAddress ?? this.emailAddress,
//       password: password ?? this.password,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       isAdmin: isAdmin ?? this.isAdmin,
//       token: token ?? this.token,
//       adminToken:
//           (isAdmin ?? this.isAdmin!) ? (adminToken ?? this.adminToken) : null,
//     );
//   }
// }
