part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetailsEntity movieDetailsEntity;

  const MovieDetailsLoadedState(this.movieDetailsEntity);

  @override
  List<Object> get props => [movieDetailsEntity.id];
}
