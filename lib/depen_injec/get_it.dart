import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app/common/translations/app_languages.dart';
import 'package:movies_app/common/translations/app_localizations.dart';
import 'package:movies_app/common/translations/app_translator.dart';

import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getIt = GetIt.instance;

class AppGetIt {
  const AppGetIt._();

  static Future init() async {
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(Client()));
    getIt.registerLazySingleton<MoviesDataSource>(
      () => MoviesDataSourceImpl(getIt<ApiClient>()),
    );
    getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(getIt<MoviesDataSource>()),
    );
    getIt.registerLazySingleton<GetTrending>(
      () => GetTrending(getIt<MoviesRepository>()),
    );
    getIt.registerLazySingleton<GetPopular>(
      () => GetPopular(getIt<MoviesRepository>()),
    );
    getIt.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getIt<MoviesRepository>()),
    );
    getIt.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getIt<MoviesRepository>()),
    );
    getIt.registerLazySingleton<GetMovieDetails>(
      () => GetMovieDetails(getIt<MoviesRepository>()),
    );
    getIt.registerFactory(() => MovieBackdropBloc());
    getIt.registerFactory(
      () => MovieCarouselBloc(
        getTrending: getIt<GetTrending>(),
        movieBackdropBloc: getIt<MovieBackdropBloc>(),
      ),
    );
    getIt.registerFactory(
      () => MovieTabbedBloc(
        getPopular: getIt<GetPopular>(),
        getPlayinNow: getIt<GetPlayingNow>(),
        getComingSoon: getIt<GetComingSoon>(),
      ),
    );
    getIt.registerFactory(
      () => MovieDetailsBloc(getIt<GetMovieDetails>()),
    );
    getIt.registerLazySingleton(() => LanguageBloc());
    getIt.registerSingleton<AppLanguages>(AppLanguages.singleton());
    getIt.registerFactoryParam<AppTranslator, BuildContext, Object>(
      (context, nullParam) =>
          Localizations.of(context, AppLocalizations).translator,
    );
  }
}
