import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/common/utils/find_translator.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/widgets/app_error_widget.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/movies_tabbed_list.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key key}) : super(key: key);

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  MovieTabbedBloc get _movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  @override
  void initState() {
    super.initState();
    _waitAndselectFirstTab();
  }

  void _waitAndselectFirstTab() async {
    await Future.delayed(Duration.zero);
    return _changeTabIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: MovieTabs.getMovieTabs(
                Utils.findTranslator(context),
              ).map((movieTab) {
                return TabTitleWidget(
                  title: movieTab.title,
                  onPressed: () => _changeTabIndex(movieTab.index),
                  isSelected: state.currentIndex == movieTab.index,
                );
              }).toList(),
            ),
            Builder(
              builder: (context) {
                if (state is MovieTabbedChanged) {
                  return Movietab(
                    movies: state.movies,
                    currentTabIndex: state.currentIndex,
                  );
                }
                if (state is MovieTabbedLoadError) {
                  return AppErrorWidget(
                    appErrorType: state.appErrorType,
                    retryFunction: () => _movieTabbedBloc
                        .add(MovieTabbedChangeEvent(state.currentIndex)),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }

  void _changeTabIndex(int index) {
    _movieTabbedBloc.add(MovieTabbedChangeEvent(index));
  }
}

class Movietab extends StatelessWidget {
  final List<MovieEntity> movies;
  final int currentTabIndex;

  const Movietab({
    Key key,
    @required this.movies,
    @required this.currentTabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movies.length == 0
        ? Expanded(
            child: Center(
              child: Text(
                Utils.findTranslator(context).noMoviesMessage,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          )
        : Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: MoviesTabbedList(
                movies: movies,
                key: ValueKey(currentTabIndex),
              ),
            ),
          );
  }
}
