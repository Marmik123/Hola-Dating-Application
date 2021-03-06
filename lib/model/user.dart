import 'dart:convert';

/*
class User {
  User({
    this.forgotPasswordToken,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.profilePic,
    this.dateOfBirth,
    this.emailVerifyToken,
    this.gender,
    this.isActive,
    this.disableNotification,
    this.deletedBy,
    this.deleted,
    this.id,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.name,
    this.email,
    this.username,
    this.fullname,
    this.profilePicUrl,
    this.userId,
  });

  dynamic forgotPasswordToken;
  dynamic address1;
  dynamic address2;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic postalCode;
  String profilePic;
  String dateOfBirth;
  dynamic emailVerifyToken;
  String gender;
  bool isActive;
  bool disableNotification;
  String deletedBy;
  bool deleted;
  String id;
  String mobileNumber;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String name;
  String email;
  String username;
  String fullname;
  String profilePicUrl;
  String userId;

  User copyWith({
    dynamic forgotPasswordToken,
    dynamic address1,
    dynamic address2,
    dynamic city,
    dynamic state,
    dynamic country,
    dynamic postalCode,
    String profilePic,
    String dateOfBirth,
    dynamic emailVerifyToken,
    String gender,
    bool isActive,
    bool disableNotification,
    String deletedBy,
    bool deleted,
    String id,
    String mobileNumber,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
    String name,
    String email,
    String username,
    String fullname,
    String profilePicUrl,
    String userId,
  }) =>
      User(
        forgotPasswordToken: forgotPasswordToken ?? this.forgotPasswordToken,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        profilePic: profilePic ?? this.profilePic,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerifyToken: emailVerifyToken ?? this.emailVerifyToken,
        gender: gender ?? this.gender,
        isActive: isActive ?? this.isActive,
        disableNotification: disableNotification ?? this.disableNotification,
        deletedBy: deletedBy ?? this.deletedBy,
        deleted: deleted ?? this.deleted,
        id: id ?? this.id,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        fullname: fullname ?? this.fullname,
        profilePicUrl: profilePicUrl ?? this.profilePicUrl,
        userId: userId ?? this.userId,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        forgotPasswordToken: json["forgot_password_token"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        emailVerifyToken: json["email_verify_token"],
        gender: json["gender"] == null ? null : json["gender"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        disableNotification: json["disable_notification"] == null
            ? null
            : json["disable_notification"],
        deletedBy: json["deleted_by"] == null ? null : json["deleted_by"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        id: json["_id"] == null ? null : json["_id"],
        mobileNumber:
            json["mobile_number"] == null ? null : json["mobile_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        v: json["__v"] == null ? null : json["__v"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        profilePicUrl:
            json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        userId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "forgot_password_token": forgotPasswordToken,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "profile_pic": profilePic == null ? null : profilePic,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "email_verify_token": emailVerifyToken,
        "gender": gender == null ? null : gender,
        "is_active": isActive == null ? null : isActive,
        "disable_notification":
            disableNotification == null ? null : disableNotification,
        "deleted_by": deletedBy == null ? null : deletedBy,
        "deleted": deleted == null ? null : deleted,
        "_id": id == null ? null : id,
        "mobile_number": mobileNumber == null ? null : mobileNumber,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "fullname": fullname == null ? null : fullname,
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "id": userId == null ? null : userId,
      };
}
*/

class User {
  User({
    this.mobileNumber,
    this.gender,
    this.dateOfBirth,
    this.name,
    this.title,
    this.description,
  });

  var mobileNumber;
  var gender;
  var dateOfBirth;
  var name;
  var title;
  var description;

  User copyWith({
    var mobileNumber,
    var gender,
    var dateOfBirth,
    var name,
    var title,
    var description,
  }) =>
      User(
        mobileNumber: mobileNumber ?? this.mobileNumber,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        name: name ?? this.name,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  dynamic toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        mobileNumber:
            json["mobile_number"] == null ? null : json["mobile_number"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "mobile_number": mobileNumber == null ? null : mobileNumber,
        "gender": gender == null ? null : gender,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "name": name == null ? null : name,
        "title": title ?? this.title,
        "description": description ?? this.description,
      };
}
