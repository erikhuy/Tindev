// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

University universityFromJson(String str) => University.fromJson(json.decode(str));

String universityToJson(University data) => json.encode(data.toJson());

class University {
    University({
        this.universities,
    });

    List<UniversityElement> universities;

    factory University.fromJson(Map<String, dynamic> json) => University(
        universities: List<UniversityElement>.from(json["universities"].map((x) => UniversityElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "universities": List<dynamic>.from(universities.map((x) => x.toJson())),
    };
}

class UniversityElement {
    UniversityElement({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory UniversityElement.fromJson(Map<String, dynamic> json) => UniversityElement(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
