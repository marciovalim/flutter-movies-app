import 'package:dartz/dartz.dart';

import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetMovieDetails extends Usecase<MovieDetailsModel, MovieParams> {
  GetMovieDetails(MoviesRepository movieRepository) : super(movieRepository);

  @override
  Future<Either<AppError, MovieDetailsModel>> call(MovieParams params) {
    return movieRepository.getMovieDetails(params.id);
  }
}
