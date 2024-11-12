// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  String dataClass;
  List<Result> results;
  int count;
  double mean;

  Data({
    required this.dataClass,
    required this.results,
    required this.count,
    required this.mean,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataClass: json["__CLASS__"],
        results: (json["results"] as List<dynamic>?)
                ?.map((result) => Result.fromJson(result))
                .toList() ??
            [],
        count: json["count"] ?? 0,
        mean: json["mean"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "__CLASS__": dataClass,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "count": count,
        "mean": mean,
      };
}

class Result {
  double salaryMin;
  String contractTime;
  ResultClass resultClass;
  Category category;
  DateTime created;
  double salaryMax;
  Location location;
  double latitude;
  double longitude;
  String contractType;
  Company company;
  String salaryIsPredicted;
  String adref;
  String redirectUrl;
  String id;
  String title;
  String description;

  Result({
    required this.salaryMin,
    required this.contractTime,
    required this.resultClass,
    required this.category,
    required this.created,
    required this.salaryMax,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.contractType,
    required this.company,
    required this.salaryIsPredicted,
    required this.adref,
    required this.redirectUrl,
    required this.id,
    required this.title,
    required this.description,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        salaryMin: json["salary_min"]?.toDouble() ?? 0.0,
        contractTime: json["contract_time"] ?? "",
        resultClass: resultClassValues.map[json["__CLASS__"]]!,
        category: Category.fromJson(json["category"]),
        created: DateTime.parse(json["created"]),
        salaryMax: json["salary_max"]?.toDouble() ?? 0.0,
        location: Location.fromJson(json["location"]),
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
        contractType: json["contract_type"] ?? "",
        company: Company.fromJson(json["company"]),
        salaryIsPredicted: json["salary_is_predicted"],
        adref: json["adref"],
        redirectUrl: json["redirect_url"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "salary_min": salaryMin,
        "contract_time": contractTime,
        "__CLASS__": resultClassValues.reverse[resultClass],
        "category": category.toJson(),
        "created": created.toIso8601String(),
        "salary_max": salaryMax,
        "location": location.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "contract_type": contractType,
        "company": company.toJson(),
        "salary_is_predicted": salaryIsPredicted,
        "adref": adref,
        "redirect_url": redirectUrl,
        "id": id,
        "title": title,
        "description": description,
      };
}

class Category {
  Label label;
  Tag tag;
  CategoryClass categoryClass;

  Category({
    required this.label,
    required this.tag,
    required this.categoryClass,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        label: labelValues.map[json["label"]]!,
        tag: tagValues.map[json["tag"]]!,
        categoryClass: categoryClassValues.map[json["__CLASS__"]]!,
      );

  Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "tag": tagValues.reverse[tag],
        "__CLASS__": categoryClassValues.reverse[categoryClass],
      };
}

enum CategoryClass { ADZUNA_API_RESPONSE_CATEGORY }

final categoryClassValues = EnumValues({
  "Adzuna::API::Response::Category": CategoryClass.ADZUNA_API_RESPONSE_CATEGORY
});

enum Label { IT_JOBS }

final labelValues = EnumValues({"IT Jobs": Label.IT_JOBS});

enum Tag { IT_JOBS }

final tagValues = EnumValues({"it-jobs": Tag.IT_JOBS});

class Company {
  CompanyClass companyClass;
  String displayName;

  Company({
    required this.companyClass,
    required this.displayName,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyClass: companyClassValues.map[json["__CLASS__"]]!,
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "__CLASS__": companyClassValues.reverse[companyClass],
        "display_name": displayName,
      };
}

enum CompanyClass { ADZUNA_API_RESPONSE_COMPANY }

final companyClassValues = EnumValues({
  "Adzuna::API::Response::Company": CompanyClass.ADZUNA_API_RESPONSE_COMPANY
});

enum ContractTime { FULL_TIME }

final contractTimeValues = EnumValues({"full_time": ContractTime.FULL_TIME});

enum ContractType { CONTRACT, PERMANENT }

final contractTypeValues = EnumValues(
    {"contract": ContractType.CONTRACT, "permanent": ContractType.PERMANENT});

class Location {
  List<String> area;
  LocationClass locationClass;
  String displayName;

  Location({
    required this.area,
    required this.locationClass,
    required this.displayName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        area: List<String>.from(json["area"].map((x) => x)),
        locationClass: locationClassValues.map[json["__CLASS__"]]!,
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "area": List<dynamic>.from(area.map((x) => x)),
        "__CLASS__": locationClassValues.reverse[locationClass],
        "display_name": displayName,
      };
}

enum LocationClass { ADZUNA_API_RESPONSE_LOCATION }

final locationClassValues = EnumValues({
  "Adzuna::API::Response::Location": LocationClass.ADZUNA_API_RESPONSE_LOCATION
});

enum ResultClass { ADZUNA_API_RESPONSE_JOB }

final resultClassValues = EnumValues(
    {"Adzuna::API::Response::Job": ResultClass.ADZUNA_API_RESPONSE_JOB});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
