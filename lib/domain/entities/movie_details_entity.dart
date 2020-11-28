import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backdropPath;
  final String posterPath;

  const MovieDetailsEntity({
    @required this.id,
    @required this.title,
    @required this.overview,
    @required this.releaseDate,
    @required this.voteAverage,
    @required this.backdropPath,
    @required this.posterPath,
  });

  @override
  List<Object> get props => [id];
}
