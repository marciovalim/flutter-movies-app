import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_response_model.dart';

abstract class MoviesDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailsModel> getMovieDetails(int id);
}

class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiClient _apiClient;

  MoviesDataSourceImpl(this._apiClient);

  @override
  Future<List<MovieModel>> getTrending() async {
    final decodedResponse = await _apiClient.get('/trending/movies/day');
    return _parseDecodedResponse(decodedResponse);
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final decodedResponse = await _apiClient.get('/movie/popular');
    return _parseDecodedResponse(decodedResponse);
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final decodedResponse = await _apiClient.get('/movie/upcoming');
    return _parseDecodedResponse(decodedResponse);
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final decodedResponse = await _apiClient.get('/movie/now_playing');
    return _parseDecodedResponse(decodedResponse);
  }

  List<MovieModel> _parseDecodedResponse(dynamic decodedResponse) {
    return MoviesResponseModel.fromJson(decodedResponse).movies;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await _apiClient.get('/movie/$id');
    final movie = MovieDetailsModel.fromJson(response);
    return movie;
  }
}
