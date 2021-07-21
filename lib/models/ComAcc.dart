// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
    Company({
        this.company,
    });

    CompanyClass company;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        company: CompanyClass.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "company": company.toJson(),
    };
}

class CompanyClass {
    CompanyClass({
        this.photoId,
        this.facebookUrl,
        this.linkedinUrl,
        this.twitterUrl,
        this.description,
        this.status,
        this.id,
        this.email,
        this.name,
        this.phone,
        this.city,
        this.taxCode,
        this.userId,
        this.v,
        this.photoUrl,
    });

    String photoId;
    String facebookUrl;
    String linkedinUrl;
    String twitterUrl;
    String description;
    String status;
    String id;
    String email;
    String name;
    String phone;
    String city;
    String taxCode;
    String userId;
    int v;
    String photoUrl;

    factory CompanyClass.fromJson(Map<String, dynamic> json) => CompanyClass(
        photoId: json["photo_id"],
        facebookUrl: json["facebook_url"],
        linkedinUrl: json["linkedin_url"],
        twitterUrl: json["twitter_url"],
        description: json["description"],
        status: json["status"],
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        city: json["city"],
        taxCode: json["tax_code"],
        userId: json["user_id"],
        v: json["__v"],
        photoUrl: json["photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "photo_id": photoId,
        "facebook_url": facebookUrl,
        "linkedin_url": linkedinUrl,
        "twitter_url": twitterUrl,
        "description": description,
        "status": status,
        "_id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "city": city,
        "tax_code": taxCode,
        "user_id": userId,
        "__v": v,
        "photo_url": photoUrl,
    };
}
