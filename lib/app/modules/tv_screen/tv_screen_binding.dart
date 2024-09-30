import 'package:zero/app/core/utils/exports.dart';

class TvScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TVScreenController>(
      () => TVScreenController(),
    );
  }
}
