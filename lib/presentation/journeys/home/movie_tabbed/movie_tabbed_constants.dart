import 'package:movies_app/common/constants/translation_keys.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: TranslationKeys.popular),
    const Tab(index: 1, title: TranslationKeys.now),
    const Tab(index: 2, title: TranslationKeys.soon),
  ];
}
