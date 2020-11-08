import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_size/responsive_size.dart';
import 'package:math_utils/math_utils.dart';

import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import './animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;

  const MoviePageView({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;
  int _initialIndex;

  @override
  void initState() {
    super.initState();
    _initialIndex = widget.movies.length * 1e6.toInt();
    _pageController = PageController(
      initialPage: _initialIndex,
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
        onPageChanged: (pageIndex) {
          final moviesIndex = loopIndex(pageIndex);
          BlocProvider.of<MovieBackdropBloc>(context).add(
            MovieBackdropChangedEvent(
              widget.movies[moviesIndex],
            ),
          );
        },
        itemBuilder: (context, pageIndex) {
          final movie = widget.movies[loopIndex(pageIndex)];
          return AnimatedMovieCardWidget(
            index: pageIndex,
            initialIndex: _initialIndex,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }

  int loopIndex(int index) {
    return index.loop(widget.movies.length);
  }
}
