import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/tv_screen/tv_episodes_screen/tv_episodes_screen_controller.dart';

class TvEpisodesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvEpisodesScreenController>(
      () => TvEpisodesScreenController(),
    );
  }
}
