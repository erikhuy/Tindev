// To parse this JSON data, do
//
//     final skill = skillFromJson(jsonString);

import 'dart:convert';

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));

String skillToJson(Skill data) => json.encode(data.toJson());

class Skill {
    Skill({
        this.skills,
    });

    List<SkillElement> skills;

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skills: List<SkillElement>.from(json["skills"].map((x) => SkillElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    };
}

class SkillElement {
    SkillElement({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory SkillElement.fromJson(Map<String, dynamic> json) => SkillElement(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
