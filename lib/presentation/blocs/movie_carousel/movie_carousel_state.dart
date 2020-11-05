part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final int initialIndex;
  final List<MovieEntity> movies;

  const MovieCarouselLoaded({
    @required this.movies,
    @required this.initialIndex,
  });

  @override
  List<Object> get props => [initialIndex, movies];
}

class MovieCarouselError extends MovieCarouselState {}
