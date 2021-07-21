// To parse this JSON data, do
//
//     final developer = developerFromJson(jsonString);

import 'dart:convert';

Developer developerFromJson(String str) => Developer.fromJson(json.decode(str));

String developerToJson(Developer data) => json.encode(data.toJson());

class Developer {
    Developer({
        this.developer,
    });

    DeveloperClass developer;

    factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        developer: DeveloperClass.fromJson(json["developer"]),
    );

    Map<String, dynamic> toJson() => {
        "developer": developer.toJson(),
    };
}

class DeveloperClass {
    DeveloperClass({
        this.jobExpectation,
        this.photoId,
        this.facebookUrl,
        this.linkedinUrl,
        this.twitterUrl,
        this.description,
        this.skills,
        this.status,
        this.id,
        this.email,
        this.fullName,
        this.birthday,
        this.phone,
        this.gender,
        this.city,
        this.userId,
        this.v,
        this.photoUrl,
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
    String email;
    String fullName;
    DateTime birthday;
    String phone;
    String gender;
    String city;
    String userId;
    int v;
    String photoUrl;

    factory DeveloperClass.fromJson(Map<String, dynamic> json) => DeveloperClass(
        jobExpectation: JobExpectation.fromJson(json["job_expectation"]),
        photoId: json["photo_id"],
        facebookUrl: json["facebook_url"],
        linkedinUrl: json["linkedin_url"],
        twitterUrl: json["twitter_url"],
        description: json["description"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        status: json["status"],
        id: json["_id"],
        email: json["email"],
        fullName: json["full_name"],
        birthday: DateTime.parse(json["birthday"]),
        phone: json["phone"],
        gender: json["gender"],
        city: json["city"],
        userId: json["user_id"],
        v: json["__v"],
        photoUrl: json["photo_url"],
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
        "email": email,
        "full_name": fullName,
        "birthday": birthday.toIso8601String(),
        "phone": phone,
        "gender": gender,
        "city": city,
        "user_id": userId,
        "__v": v,
        "photo_url": photoUrl,
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
