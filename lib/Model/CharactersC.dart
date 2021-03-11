import 'dart:convert';

CharactersC charactersFromJson(String str) => CharactersC.fromJson(json.decode(str));

String charactersToJson(CharactersC data) => json.encode(data.toJson());

class CharactersC {
  CharactersC({
    this.info,
    this.results,
  });

  Info info;
  List<Result2> results;

  factory CharactersC.fromJson(Map<String, dynamic> json) => CharactersC(
    info: Info.fromJson(json["info"]),
    results: List<Result2>.from(json["results"].map((x) => Result2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result2 {
  Result2({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  factory Result2.fromJson(Map<String, dynamic> json) => Result2(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "origin": origin.toJson(),
    "location": location.toJson(),
    "image": image,
    "episode": List<dynamic>.from(episode.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),
  };
}

class Location {
  Location({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
