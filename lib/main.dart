import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';

void main() async {
  final apiClient = ApiClient(Client());
  MoviesDataSource moviesDataSource = MoviesDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(moviesDataSource);
  final getTrending = GetTrending(movieRepository);
  final getPopular = GetPopular(movieRepository);
  final getPlayingNow = GetPlayingNow(movieRepository);
  final getComingSoon = GetComingSoon(movieRepository);
  final eitherResponse = await getTrending.call(NoParams());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(),
    );
  }
}
