import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/depen_injec/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:movies_app/presentation/widgets/app_error_widget.dart';
import 'package:movies_app/presentation/widgets/app_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc _movieCarouselBloc;
  MovieBackdropBloc _movieBackdropBloc;
  MovieTabbedBloc _movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    _movieCarouselBloc = getIt<MovieCarouselBloc>();
    _movieBackdropBloc = _movieCarouselBloc.movieBackdropBloc;
    _movieTabbedBloc = getIt<MovieTabbedBloc>();
    _movieCarouselBloc.add(MovieCarouselLoadEvent());
  }

  @override
  void dispose() {
    _movieCarouselBloc?.close();
    _movieBackdropBloc?.close();
    _movieTabbedBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieCarouselBloc),
          BlocProvider.value(value: _movieBackdropBloc),
          BlocProvider.value(value: _movieTabbedBloc),
        ],
        child: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (_, state) {
            if (state is MovieCarouselLoading) {
              return AppProgressIndicator();
            }
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: const MovieTabbedWidget(),
                  ),
                ],
              );
            }
            if (state is MovieCarouselLoadError) {
              return AppErrorWidget(
                appErrorType: state.appErrorType,
                retryFunction: () {
                  _movieCarouselBloc.add(MovieCarouselLoadEvent());
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
