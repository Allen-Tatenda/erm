// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginSuccessModel welcomeFromJson(String str) => LoginSuccessModel.fromJson(json.decode(str));

String welcomeToJson(LoginSuccessModel data) => json.encode(data.toJson());

class LoginSuccessModel {
    final String token;
    final UserInfo? userInfo;

    LoginSuccessModel({
        required this.token,
        this.userInfo,
    });

    factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
        token: json["token"],
        userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "userInfo": userInfo?.toJson(),
    };
}

class UserInfo {
    final String? username;
    final String? firstName;
    final dynamic password;
    final String? email;
    final dynamic createdAt;
    final String? lastName;
    final String? phone;
    final bool? enabled;
    final dynamic status;
    final List<Role>? roles;

    UserInfo({
        this.username,
        this.firstName,
        this.password,
        this.email,
        this.createdAt,
        this.lastName,
        this.phone,
        this.enabled,
        this.status,
        this.roles,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        username: json["username"],
        firstName: json["firstName"],
        password: json["password"],
        email: json["email"],
        createdAt: json["createdAt"],
        lastName: json["lastName"],
        phone: json["phone"],
        enabled: json["enabled"],
        status: json["status"],
        roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "password": password,
        "email": email,
        "createdAt": createdAt,
        "lastName": lastName,
        "phone": phone,
        "enabled": enabled,
        "status": status,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    };
}

class Role {
    final dynamic id;
    final String? name;
    final String? role;
    final String? description;
    final String? authority;
    final String? nameCode;
    final String? descriptionCode;

    Role({
        this.id,
        this.name,
        this.role,
        this.description,
        this.authority,
        this.nameCode,
        this.descriptionCode,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        description: json["description"],
        authority: json["authority"],
        nameCode: json["nameCode"],
        descriptionCode: json["descriptionCode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "description": description,
        "authority": authority,
        "nameCode": nameCode,
        "descriptionCode": descriptionCode,
    };
}
