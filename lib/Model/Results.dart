

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
 Model({
  this.results,
 });

 List<Result> results;

 factory Model.fromJson(Map<String, dynamic> json) => Model(
  results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
 );

 Map<String, dynamic> toJson() => {
  "results": List<dynamic>.from(results.map((x) => x.toJson())),
 };
}

class Result {
 Result({
  this.id,
  this.name,
  this.airDate,
  this.episode,
  this.characters,
  this.url,
  this.created,
 });

 int id;
 String name;
 String airDate;
 String episode;
 List<String> characters;
 String url;
 DateTime created;

 factory Result.fromJson(Map<String, dynamic> json) => Result(
  id: json["id"],
  name: json["name"],
  airDate: json["air_date"],
  episode: json["episode"],
  characters: List<String>.from(json["characters"].map((x) => x)),
  url: json["url"],
  created: DateTime.parse(json["created"]),
 );

 Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "air_date": airDate,
  "episode": episode,
  "characters": List<dynamic>.from(characters.map((x) => x)),
  "url": url,
  "created": created.toIso8601String(),
 };
}
