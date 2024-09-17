import 'package:zero/app/core/utils/exports.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () => Get.offAllNamed(
        Routes.mainScreen,
      ),
    );
    super.onInit();
  }
}
