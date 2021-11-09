import 'dart:convert';

ResSearch resSearchFromJson(String str) => ResSearch.fromJson(json.decode(str));

String resSearchToJson(ResSearch data) => json.encode(data.toJson());

class ResSearch {
  ResSearch({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
  });

  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Doc>? docs;

  factory ResSearch.fromJson(Map<String, dynamic> json) => ResSearch(
    numFound: json["numFound"],
    start: json["start"],
    numFoundExact: json["numFoundExact"],
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "numFound": numFound,
    "start": start,
    "numFoundExact": numFoundExact,
    "docs": List<dynamic>.from(docs!.map((x) => x.toJson())),
  };
}

class Doc {
  Doc({
    this.key,
    this.type,
    this.name,
    this.alternateNames,
    this.birthDate,
    this.deathDate,
    this.date,
    this.topWork,
    this.workCount,
    this.topSubjects,
    this.version,
  });

  String? key;
  Type? type;
  String? name;
  List<String>? alternateNames;
  String? birthDate;
  String? deathDate;
  String? date;
  String? topWork;
  int? workCount;
  List<String>? topSubjects;
  double? version;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    key: json["key"],
    type: typeValues.map![json["type"]],
    name: json["name"],
    alternateNames: json["alternate_names"] == null ? null : List<String>.from(json["alternate_names"].map((x) => x)),
    birthDate: json["birth_date"] == null ? null : json["birth_date"],
    deathDate: json["death_date"] == null ? null : json["death_date"],
    date: json["date"] == null ? null : json["date"],
    topWork: json["top_work"] == null ? null : json["top_work"],
    workCount: json["work_count"],
    topSubjects: json["top_subjects"] == null ? null : List<String>.from(json["top_subjects"].map((x) => x)),
    version: json["_version_"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "type": typeValues.reverse![type],
    "name": name,
    "alternate_names": alternateNames == null ? null : List<dynamic>.from(alternateNames!.map((x) => x)),
    "birth_date": birthDate ?? null,
    "death_date": deathDate == null ? null : deathDate,
    "date": date == null ? null : date,
    "top_work": topWork == null ? null : topWork,
    "work_count": workCount,
    "top_subjects": topSubjects == null ? null : List<dynamic>.from(topSubjects!.map((x) => x)),
    "_version_": version,
  };
}

enum Type { AUTHOR }

final typeValues = EnumValues({
  "author": Type.AUTHOR
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

