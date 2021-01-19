import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/depen_injec/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_arguments.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsArguments movieDetailsArguments;

  const MovieDetailsScreen({
    Key key,
    @required this.movieDetailsArguments,
  }) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsBloc _movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailsBloc = getIt<MovieDetailsBloc>();
    _movieDetailsBloc
        .add(MovieDetailsLoadEvent(widget.movieDetailsArguments.movieId));
  }

  @override
  void dispose() {
    _movieDetailsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailsBloc>.value(
        value: _movieDetailsBloc,
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsErrorState) {
              return Container();
            }
            if (state is MovieDetailsLoadedState) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
