import 'package:zero/app/core/utils/exports.dart';

class DependencyInjector {
  static init() {
    Get.lazyPut(
      () => SplashScreenController(),
      fenix: true,
    );
    // Get.lazyPut(
    //   () => HomeScreenController(),
    //   fenix: true,
    // );
  }
}
