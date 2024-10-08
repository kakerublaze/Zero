import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/tv_screen/tv_episodes_screen/tv_episodes_screen_binding.dart';

import '../modules/tv_screen/tv_episodes_screen/tv_episodes_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
      binding: DetailsScreenBinding(),
    ),
    GetPage(
      name: Routes.tvEpisodesScreen,
      page: () => const TvEpisodesScreen(),
      binding: TvEpisodesScreenBinding(),
    ),
  ];
}
