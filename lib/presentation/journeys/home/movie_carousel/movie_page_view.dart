import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialIndex;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initialIndex,
  }) : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialIndex,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.s10.h),
      height: ResponsiveSize.screenHeight * 0.35,
      child: PageView.builder(
        pageSnapping: true,
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}
