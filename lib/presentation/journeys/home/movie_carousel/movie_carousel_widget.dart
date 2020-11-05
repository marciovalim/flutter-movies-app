import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_title_widget.dart';
import 'package:movies_app/presentation/widgets/movie_app_bar.dart';
import 'package:movies_app/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final int initialIndex;
  final List<MovieEntity> movies;

  const MovieCarouselWidget({
    Key key,
    @required this.initialIndex,
    @required this.movies,
  })  : assert(initialIndex >= 0, 'initialIndex should be greater than zero'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies, initialIndex: initialIndex),
            MovieTitleWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
