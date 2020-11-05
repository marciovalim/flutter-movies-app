import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getIt = GetIt.instance;

Future initGetIt() async {
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
  getIt.registerFactory(() => MovieBackdropBloc());
  getIt.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getIt<GetTrending>(),
      movieBackdropBloc: getIt<MovieBackdropBloc>(),
    ),
  );
}
