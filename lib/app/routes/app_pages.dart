import 'package:zero/app/core/utils/exports.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    // GetPage(
    //   name: Routes.mainPage,
    //   page: () => const MainScreen(),
    //   binding: MainScreenBinding(),
    // ),
    // GetPage(
    //   name: Routes.homeScreen,
    //   page: () => const HomeScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.animeScreen,
    //   page: () => const AnimeScreen(),
    //   binding: AnimeBinding(),
    // ),
    // GetPage(
    //   name: Routes.mangaScreen,
    //   page: () => const MangaScreen(),
    //   binding: MangaBinding(),
    // ),
    // GetPage(
    //   name: Routes.animeDetailsScreen,
    //   page: () => const AnimeDetailsPage(),
    //   binding: AnimeDetailsPageBinding(),
    // ),
    // GetPage(
    //   name: Routes.videoPlayer,
    //   page: () => const VideoPlayerScreen(),
    //   binding: VideoPlayerBinding(),
    // ),
    // // GetPage(
    // //   name: Routes.downloadAnime,
    // //   page: () => const DownloadAnimePage(),
    // //   binding: VideoPlayerBinding(),
    // // ),
    // GetPage(
    //   name: Routes.explore,
    //   page: () => const ExploreScreen(),
    //   binding: ExploreBindings(),
    // ),
    // GetPage(
    //   name: Routes.profile,
    //   page: () => const ProfileScreen(),
    //   binding: ProfileBinding(),
    // ),
    // GetPage(
    //   name: Routes.editProfile,
    //   page: () => const EditProfileScreen(),
    //   binding: ProfileBinding(),
    // ),
    // GetPage(
    //   name: Routes.exploreList,
    //   page: () => const ExploreListScreen(),
    //   binding: ExploreListBindings(),
    // ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => const LoginScreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: Routes.signUp,
    //   page: () => const SignupScreen(),
    //   binding: SignupBinding(),
    // ),
    // GetPage(
    //   name: Routes.newsDetails,
    //   page: () => const NewsDetailsScreen(),
    //   binding: NewsDetailsBinding(),
    // ),
    // GetPage(
    //   name: Routes.airingSchedule,
    //   page: () => const AiringScheduleScreen(),
    //   binding: AiringScheduleBinding(),
    // ),
  ];
}
