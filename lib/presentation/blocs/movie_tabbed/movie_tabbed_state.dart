part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentIndex;

  const MovieTabbedState({this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabbedChanged({
    @required this.movies,
    @required int currentIndex,
  }) : super(currentIndex: currentIndex);

  @override
  List<Object> get props => [movies, currentIndex];
}

class MovieTabbedLoadError extends MovieTabbedState {}
