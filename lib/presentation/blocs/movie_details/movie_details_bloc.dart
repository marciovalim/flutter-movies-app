import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_details_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc(this.getMovieDetails) : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is MovieDetailsLoadEvent) {
      yield MovieDetailsLoadingState();
      final eitherResponse =
          await getMovieDetails.call(MovieParams(event.movieId));
      yield eitherResponse.fold(
        (error) => MovieDetailsErrorState(),
        (movieDetails) => MovieDetailsLoadedState(movieDetails),
      );
    }
  }
}
