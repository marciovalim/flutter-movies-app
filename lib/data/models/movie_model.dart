import 'package:flutter/foundation.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool video;
  final int voteCount;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final bool adult;
  final double popularity;
  final String mediaType;

  MovieModel({
    @required int id,
    @required String title,
    @required String overview,
    @required String releaseDate,
    @required double voteAverage,
    @required String backdropPath,
    @required String posterPath,
    @required this.video,
    @required this.voteCount,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.genreIds,
    @required this.adult,
    @required this.popularity,
    @required this.mediaType,
  }) : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
          backdropPath: backdropPath,
          posterPath: posterPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      video: json['video'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      title: json['title'] ?? '',
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
