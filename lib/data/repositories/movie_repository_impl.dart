import 'package:dartz/dartz.dart';

import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl(this.moviesDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await moviesDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong with getTrending'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await moviesDataSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong with getComingSoon'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await moviesDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong with getPlayingNow'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await moviesDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong with getPopular'));
    }
  }
}
