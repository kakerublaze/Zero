import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/settings_screen/settings_screen_controller.dart';

class SettingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsScreenController>(
      () => SettingsScreenController(),
    );
  }
}
