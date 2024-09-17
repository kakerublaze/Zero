import 'package:zero/app/core/utils/exports.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
    );
  }
}
