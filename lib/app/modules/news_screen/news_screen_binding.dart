import 'package:zero/app/core/utils/exports.dart';

class NewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsScreenController>(
      () => NewsScreenController(),
    );
  }
}
