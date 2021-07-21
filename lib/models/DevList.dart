// To parse this JSON data, do
//
//     final devList = devListFromJson(jsonString);

import 'dart:convert';

DevList devListFromJson(String str) => DevList.fromJson(json.decode(str));

String devListToJson(DevList data) => json.encode(data.toJson());

class DevList {
    DevList({
        this.developers,
    });

    List<Developer> developers;

    factory DevList.fromJson(Map<String, dynamic> json) => DevList(
        developers: List<Developer>.from(json["developers"].map((x) => Developer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "developers": List<dynamic>.from(developers.map((x) => x.toJson())),
    };
}

class Developer {
    Developer({
        this.jobExpectation,
        this.photoId,
        this.facebookUrl,
        this.linkedinUrl,
        this.twitterUrl,
        this.description,
        this.skills,
        this.status,
        this.id,
        this.gender,
        this.email,
        this.fullName,
        this.birthday,
        this.phone,
        this.city,
        this.userId,
        this.v,
    });

    JobExpectation jobExpectation;
    String photoId;
    String facebookUrl;
    String linkedinUrl;
    String twitterUrl;
    String description;
    List<String> skills;
    String status;
    String id;
    String gender;
    String email;
    String fullName;
    dynamic birthday;
    String phone;
    String city;
    String userId;
    int v;

    factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        jobExpectation: JobExpectation.fromJson(json["job_expectation"]),
        photoId: json["photo_id"],
        facebookUrl: json["facebook_url"],
        linkedinUrl: json["linkedin_url"],
        twitterUrl: json["twitter_url"],
        description: json["description"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        status: json["status"],
        id: json["_id"],
        gender: json["gender"],
        email: json["email"],
        fullName: json["full_name"],
        birthday: json["birthday"],
        phone: json["phone"],
        city: json["city"],
        userId: json["user_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "job_expectation": jobExpectation.toJson(),
        "photo_id": photoId,
        "facebook_url": facebookUrl,
        "linkedin_url": linkedinUrl,
        "twitter_url": twitterUrl,
        "description": description,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "status": status,
        "_id": id,
        "gender": gender,
        "email": email,
        "full_name": fullName,
        "birthday": birthday,
        "phone": phone,
        "city": city,
        "user_id": userId,
        "__v": v,
    };
}

class JobExpectation {
    JobExpectation({
        this.jobType,
        this.yearExperience,
        this.expectedSalary,
        this.workPlace,
    });

    String jobType;
    int yearExperience;
    int expectedSalary;
    String workPlace;

    factory JobExpectation.fromJson(Map<String, dynamic> json) => JobExpectation(
        jobType: json["job_type"],
        yearExperience: json["year_experience"],
        expectedSalary: json["expected_salary"],
        workPlace: json["work_place"],
    );

    Map<String, dynamic> toJson() => {
        "job_type": jobType,
        "year_experience": yearExperience,
        "expected_salary": expectedSalary,
        "work_place": workPlace,
    };
}
