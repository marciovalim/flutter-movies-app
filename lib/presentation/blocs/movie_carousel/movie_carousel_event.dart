part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class MovieCarouselLoadEvent extends MovieCarouselEvent {
  final int initialIndex;

  const MovieCarouselLoadEvent({
    this.initialIndex = 0,
  }) : assert(initialIndex >= 0, 'initialIndex cannot be less than 0');

  @override
  List<Object> get props => [initialIndex];
}
