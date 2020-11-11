import 'package:movies_app/common/translations/app_translator.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabs {
  static List<Tab> getMovieTabs(AppTranslator translator) {
    return [
      Tab(index: 0, title: translator.popular),
      Tab(index: 1, title: translator.now),
      Tab(index: 2, title: translator.soon),
    ];
  }
}
