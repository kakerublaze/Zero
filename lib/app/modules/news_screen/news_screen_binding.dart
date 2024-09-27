import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/news_screen/news_screen_controller.dart';

class NewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsScreenController>(
      () => NewsScreenController(),
    );
  }
}
