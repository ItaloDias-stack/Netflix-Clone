import 'package:json_annotation/json_annotation.dart';

part "movie.g.dart";

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String director;
  final int year;
  final String sinopse;
  final List<Episode> episodes;
  @JsonKey(name: "url")
  final String posterUrl;
  const Movie({
    this.id = -1,
    this.title = "",
    this.director = "",
    this.episodes = const [],
    this.sinopse = "",
    this.year = -1,
    this.posterUrl = "",
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Episode {
  final int id;
  final String title;
  final String director;
  final int season;
  final String sinopse;
  Episode({
    this.id = -1,
    this.title = "",
    this.director = "",
    this.sinopse = "",
    this.season = -1,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
