import 'package:movies_app/data/models/movie_model.dart';

class MoviesResponseModel {
  List<MovieModel> movies;

  MoviesResponseModel.fromJson(Map<String, dynamic> decodedJson) {
    if (decodedJson['results'] != null) {
      movies = <MovieModel>[];
      decodedJson['results'].forEach((result) {
        movies.add(MovieModel.fromJson(result));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((result) => result.toJson()).toList();
    }
    return data;
  }
}
