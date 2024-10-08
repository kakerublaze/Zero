import 'package:zero/app/core/utils/exports.dart';

class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsScreenController>(
      () => DetailsScreenController(),
    );
  }
}
