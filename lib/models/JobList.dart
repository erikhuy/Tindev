// To parse this JSON data, do
//
//     final jobList = jobListFromJson(jsonString);

import 'dart:convert';

JobList jobListFromJson(String str) => JobList.fromJson(json.decode(str));

String jobListToJson(JobList data) => json.encode(data.toJson());

class JobList {
    JobList({
        this.jobRecruitments,
    });

    List<JobRec> jobRecruitments;

    factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        jobRecruitments: List<JobRec>.from(json["job_recruitments"].map((x) => JobRec.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "job_recruitments": List<dynamic>.from(jobRecruitments.map((x) => x.toJson())),
    };
}

class JobRec {
    JobRec({
        this.id,
        this.skills,
        this.description,
        this.status,
        this.title,
        this.workPlace,
        this.expiriedDate,
        this.fromSalary,
        this.toSalary,
        this.jobType,
        this.yearExperience,
        this.createdDate,
        this.userId,
        this.v,
    });

    String id;
    List<String> skills;
    String description;
    String status;
    String title;
    String workPlace;
    DateTime expiriedDate;
    int fromSalary;
    int toSalary;
    String jobType;
    int yearExperience;
    DateTime createdDate;
    String userId;
    int v;

    factory JobRec.fromJson(Map<String, dynamic> json) => JobRec(
        id: json["_id"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        description: json["description"],
        status: json["status"],
        title: json["title"],
        workPlace: json["work_place"],
        expiriedDate: DateTime.parse(json["expiried_date"]),
        fromSalary: json["from_salary"],
        toSalary: json["to_salary"],
        jobType: json["job_type"],
        yearExperience: json["year_experience"],
        createdDate: DateTime.parse(json["created_date"]),
        userId: json["user_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "description": description,
        "status": status,
        "title": title,
        "work_place": workPlace,
        "expiried_date": "${expiriedDate.year.toString().padLeft(4, '0')}-${expiriedDate.month.toString().padLeft(2, '0')}-${expiriedDate.day.toString().padLeft(2, '0')}",
        "from_salary": fromSalary,
        "to_salary": toSalary,
        "job_type": jobType,
        "year_experience": yearExperience,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "__v": v,
    };
}
