import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/explore_screen/explore_screen_controller.dart';

class ExploreScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExploreScreenController>(
      () => ExploreScreenController(),
    );
  }
}