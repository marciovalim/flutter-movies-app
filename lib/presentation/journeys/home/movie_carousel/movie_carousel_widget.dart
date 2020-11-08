import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_title_widget.dart';
import 'package:movies_app/presentation/widgets/movie_app_bar.dart';
import 'package:movies_app/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies),
            MovieTitleWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
