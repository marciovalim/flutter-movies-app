import 'package:flutter_translation/flutter_translation.dart';

abstract class AppTranslator extends ITranslator {
  const AppTranslator();

  String get popular;
  String get now;
  String get soon;
  String get favoriteMovies;
  String get languages;
  String get feedback;
  String get about;
  String get aboutDescription;
  String get okay;
  String get somethingWentWrong;
  String get checkYourConnection;
  String get retry;
  String get reportError;
  String get noMoviesMessage;
}
