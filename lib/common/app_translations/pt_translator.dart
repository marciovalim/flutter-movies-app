import 'app_translator.dart';

class PtTranslator extends AppTranslator {
  const PtTranslator();

  @override
  String get about => 'Sobre';

  @override
  String get favoriteMovies => 'Filmes Favoritos';

  @override
  String get feedback => 'Avaliar';

  @override
  String get languages => 'Idioma';

  @override
  String get popular => 'Popular';

  @override
  String get now => 'Agora';

  @override
  String get soon => 'Em Breve';

  @override
  String get aboutDescription =>
      'Esse produto usa a TMDb API mas não é aprovado ou certificado pela TMDb. Esse aplicativo foi desenvolvido para fins educativos.';

  @override
  String get okay => 'Ok';
}
