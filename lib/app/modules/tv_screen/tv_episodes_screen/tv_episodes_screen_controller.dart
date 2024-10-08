import 'package:zero/app/core/utils/exports.dart';

class TvEpisodesScreenController extends GetxController {
  Map<String, dynamic> getArguments = {};
  TVDetailsResponseModel showDetails = TVDetailsResponseModel();

  @override
  void onInit() {
    if (Get.arguments != null) {
      getArguments = Get.arguments as Map<String, dynamic>;
      showDetails = getArguments['response'];
    }

    super.onInit();
  }
}
