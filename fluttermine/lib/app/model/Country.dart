// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Map<String, double> month;
  String dataClass;
  Location location;

  Data({
    required this.month,
    required this.dataClass,
    required this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        month: Map.from(json["month"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        dataClass: json["__CLASS__"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "month": Map.from(month).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "__CLASS__": dataClass,
        "location": location.toJson(),
      };
}

class Location {
  String displayName;
  String locationClass;
  List<String> area;

  Location({
    required this.displayName,
    required this.locationClass,
    required this.area,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        displayName: json["display_name"],
        locationClass: json["__CLASS__"],
        area: List<String>.from(json["area"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "__CLASS__": locationClass,
        "area": List<dynamic>.from(area.map((x) => x)),
      };
}
