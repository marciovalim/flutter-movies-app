import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetTrending extends Usecase<List<MovieEntity>, NoParams> {
  GetTrending(MoviesRepository movieRepository) : super(movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
}
