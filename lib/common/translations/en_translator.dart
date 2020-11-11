import 'app_translator.dart';

class EnTranslator extends AppTranslator {
  const EnTranslator();

  @override
  String get about => 'About';

  @override
  String get favoriteMovies => 'Favorite Movies';

  @override
  String get feedback => 'Feedback';

  @override
  String get languages => 'Languages';

  @override
  String get popular => 'Popular';

  @override
  String get now => 'Now';

  @override
  String get soon => 'Soon';

  @override
  String get aboutDescription =>
      'This product uses the TMDb API but is not endorsed or certified by TMDb. This app is developed for education purpose.';

  @override
  String get okay => 'Okay';

  @override
  String get checkYourConnection => 'Check you internet connection.';

  @override
  String get retry => 'Retry';

  @override
  String get somethingWentWrong => 'Something went wrong...';

  @override
  String get reportError => 'Report';

  @override
  String get noMoviesMessage => 'Sorry, no movies in this section. 😢';
}
