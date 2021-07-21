// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
    City({
        this.cities,
    });

    List<CityElement> cities;

    factory City.fromJson(Map<String, dynamic> json) => City(
        cities: List<CityElement>.from(json["cities"].map((x) => CityElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    };
}

class CityElement {
    CityElement({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory CityElement.fromJson(Map<String, dynamic> json) => CityElement(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
