import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl(this.moviesDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    return _tryGetMoviesBy(moviesDataSource.getTrending);
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    return _tryGetMoviesBy(moviesDataSource.getComingSoon);
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    return _tryGetMoviesBy(moviesDataSource.getPlayingNow);
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    return _tryGetMoviesBy(moviesDataSource.getPopular);
  }

  Future<Either<AppError, List<MovieModel>>> _tryGetMoviesBy(
    Future<List<MovieModel>> Function() getMovies,
  ) async {
    try {
      final movies = await getMovies();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.Network));
    } on Exception {
      return Left(AppError(AppErrorType.Api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final movie = await moviesDataSource.getMovieDetails(id);
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.Network));
    } on Exception {
      return Left(AppError(AppErrorType.Api));
    }
  }
}
