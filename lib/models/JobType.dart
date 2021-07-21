// To parse this JSON data, do
//
//     final jobType = jobTypeFromJson(jsonString);

import 'dart:convert';

JobType jobTypeFromJson(String str) => JobType.fromJson(json.decode(str));

String jobTypeToJson(JobType data) => json.encode(data.toJson());

class JobType {
    JobType({
        this.jobTypes,
    });

    List<JobTypeElement> jobTypes;

    factory JobType.fromJson(Map<String, dynamic> json) => JobType(
        jobTypes: List<JobTypeElement>.from(json["jobTypes"].map((x) => JobTypeElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jobTypes": List<dynamic>.from(jobTypes.map((x) => x.toJson())),
    };
}

class JobTypeElement {
    JobTypeElement({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory JobTypeElement.fromJson(Map<String, dynamic> json) => JobTypeElement(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
