import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/app_translations/app_translator.dart';
import 'package:movies_app/depen_injec/get_it.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/movies_tabbed_list.dart';
import 'package:movies_app/common/constants/size_constants.dart';
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
    return Padding(
      padding: EdgeInsets.only(top: Sizes.s4.h),
      child: BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: MovieTabs.getMovieTabs(
                  getIt.get<AppTranslator>(param1: context),
                ).map((movieTab) {
                  return TabTitleWidget(
                    title: movieTab.title,
                    onPressed: () => _changeTabIndex(movieTab.index),
                    isSelected: state.currentIndex == movieTab.index,
                  );
                }).toList(),
              ),
              if (state is MovieTabbedChanged)
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: MoviesTabbedList(
                      movies: state.movies,
                      key: ValueKey(state.currentIndex),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _changeTabIndex(int index) {
    _movieTabbedBloc.add(MovieTabbedChangeEvent(index));
  }
}
