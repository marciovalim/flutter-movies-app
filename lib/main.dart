import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';

void main() {
  final apiClient = ApiClient(Client());
  MoviesDataSource moviesDataSource = MoviesDataSourceImpl(apiClient);
  moviesDataSource.getTrending();
  moviesDataSource.getPopular();
  moviesDataSource.getComingSoon();
  moviesDataSource.getPlayingNow();
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
