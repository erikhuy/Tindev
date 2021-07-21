// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
    Education({
        this.educations,
    });

    List<EducationElement> educations;

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        educations: List<EducationElement>.from(json["educations"].map((x) => EducationElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "educations": List<dynamic>.from(educations.map((x) => x.toJson())),
    };
}

class EducationElement {
    EducationElement({
        this.isStudying,
        this.id,
        this.schoolName,
        this.fromYear,
        this.toYear,
        this.majors,
        this.userId,
        this.v,
    });

    bool isStudying;
    String id;
    String schoolName;
    int fromYear;
    int toYear;
    String majors;
    String userId;
    int v;

    factory EducationElement.fromJson(Map<String, dynamic> json) => EducationElement(
        isStudying: json["is_studying"],
        id: json["_id"],
        schoolName: json["school_name"],
        fromYear: json["from_year"],
        toYear: json["to_year"],
        majors: json["majors"],
        userId: json["user_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "is_studying": isStudying,
        "_id": id,
        "school_name": schoolName,
        "from_year": fromYear,
        "to_year": toYear,
        "majors": majors,
        "user_id": userId,
        "__v": v,
    };
}
