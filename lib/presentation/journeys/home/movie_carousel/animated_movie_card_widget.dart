import 'package:flutter/material.dart';

import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int initialIndex;
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    Key key,
    @required this.index,
    @required this.movieId,
    @required this.posterPath,
    @required this.pageController,
    @required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        if (pageController.position.haveDimensions) {
          final absDiff = (pageController.page - index).abs();
          final value = (1 - (absDiff * 0.1)).clamp(0.0, 1.0);
          return _MovieCardAnimation(
            animationValue: value,
            child: child,
          );
        }
        return _MovieCardAnimation(
          animationValue: index == initialIndex ? 1 : 0.9,
          child: child,
        );
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}

class _MovieCardAnimation extends StatelessWidget {
  final MovieCardWidget child;
  final double animationValue;

  const _MovieCardAnimation({
    Key key,
    @required this.child,
    @required this.animationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: Curves.easeIn.transform(animationValue) *
            MovieCardWidget.baseHeight,
        child: child,
      ),
    );
  }
}
