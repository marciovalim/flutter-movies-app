part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabbedChangeEvent extends MovieTabbedEvent {
  final int currentIndex;

  const MovieTabbedChangeEvent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
