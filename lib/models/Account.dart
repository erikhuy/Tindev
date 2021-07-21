// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
    Account({
        this.id,
        this.role,
        this.iat,
    });

    String id;
    String role;
    int iat;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["_id"],
        role: json["role"],
        iat: json["iat"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "iat": iat,
    };
}
