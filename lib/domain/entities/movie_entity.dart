import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieEntity extends Equatable {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    @required this.id,
    @required this.posterPath,
    @required this.backdropPath,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.overview,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
