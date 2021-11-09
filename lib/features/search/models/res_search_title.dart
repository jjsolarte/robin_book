import 'dart:convert';

ResSearchTitle resSearchTitleFromJson(String str) => ResSearchTitle.fromJson(json.decode(str));

String resSearchTitleToJson(ResSearchTitle data) => json.encode(data.toJson());

class ResSearchTitle {
  ResSearchTitle({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
    this.resSearchTitleNumFound,
    this.q,
    this.offset,
  });

  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Doct>? docs;
  int? resSearchTitleNumFound;
  String? q;
  dynamic offset;

  factory ResSearchTitle.fromJson(Map<String, dynamic> json) => ResSearchTitle(
    numFound: json["numFound"],
    start: json["start"],
    numFoundExact: json["numFoundExact"],
    docs: List<Doct>.from(json["docs"].map((x) => Doct.fromJson(x))),
    resSearchTitleNumFound: json["num_found"],
    q: json["q"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "numFound": numFound,
    "start": start,
    "numFoundExact": numFoundExact,
    "docs": List<dynamic>.from(docs!.map((x) => x.toJson())),
    "num_found": resSearchTitleNumFound,
    "q": q,
    "offset": offset,
  };
}

class Doct {
  Doct({
    this.key,
    this.type,
    this.seed,
    this.title,
    this.titleSuggest,
    this.hasFulltext,
    this.editionCount,
    this.editionKey,
    this.publishDate,
    this.publishYear,
    this.firstPublishYear,
    this.numberOfPagesMedian,
  });

  String? key;
  Type? type;
  List<String>? seed;
  String? title;
  String? titleSuggest;
  bool? hasFulltext;
  int? editionCount;
  List<String>? editionKey;
  List<String>? publishDate;
  List<int>? publishYear;
  int? firstPublishYear;
  int? numberOfPagesMedian;


  factory Doct.fromJson(Map<String, dynamic> json) => Doct(
    key: json["key"],
    type: typeValues.map![json["type"]],
    seed: List<String>.from(json["seed"].map((x) => x)),
    title: json["title"],
    titleSuggest: json["title_suggest"],
    hasFulltext: json["has_fulltext"],
    editionCount: json["edition_count"],
    editionKey: List<String>.from(json["edition_key"].map((x) => x)),
    publishDate: json["publish_date"] == null ? null : List<String>.from(json["publish_date"].map((x) => x)),
    publishYear: json["publish_year"] == null ? null : List<int>.from(json["publish_year"].map((x) => x)),
    firstPublishYear: json["first_publish_year"] == null ? null : json["first_publish_year"],
    numberOfPagesMedian: json["number_of_pages_median"] == null ? null : json["number_of_pages_median"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "type": typeValues.reverse![type],
    "seed": List<dynamic>.from(seed!.map((x) => x)),
    "title": title,
    "title_suggest": titleSuggest,
    "has_fulltext": hasFulltext,
    "edition_count": editionCount,
    "edition_key": List<dynamic>.from(editionKey!.map((x) => x)),
    "publish_date": publishDate == null ? null : List<dynamic>.from(publishDate!.map((x) => x)),
    "publish_year": publishYear == null ? null : List<dynamic>.from(publishYear!.map((x) => x)),
    "first_publish_year": firstPublishYear == null ? null : firstPublishYear,
    "number_of_pages_median": numberOfPagesMedian == null ? null : numberOfPagesMedian,
  };
}

enum Type { WORK }

final typeValues = EnumValues({
  "work": Type.WORK
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
