import 'package:move_app/common/constants/translation_constants.dart';
import 'package:move_app/presentation/journeys/home/move_tabbed/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: TranslationConstants.popular),
    const Tab(index: 1, title: TranslationConstants.now),
    const Tab(index: 2, title: TranslationConstants.soon),
  ];
}
