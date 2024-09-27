import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/tv_screen/tv_screen_controller.dart';

class TvScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TVScreenController>(
      () => TVScreenController(),
    );
  }
}
