import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/data/models/details/movies_details_response_model.dart';

class DetailsScreenController extends GetxController {
  Rx<bool> isScrolled = false.obs;
  final ScrollController scrollController = ScrollController();
  RestServices restServices = RestServices();
  Map<String, dynamic> getArguments = {};
  var token = dotenv.env['token'];
  Rx<MoviesDetailsResponseModel> moviesDetailsResponseModel =
      MoviesDetailsResponseModel().obs;

  Future<void> getDetails() async {
    await restServices
        .getResponse(
      uri: '${Endpoints.moviesDetails}/${getArguments['id']}',
      method: Method.get,
      token: token,
      isMovie: true,
    )
        .then(
      (response) {
        moviesDetailsResponseModel.value = MoviesDetailsResponseModel.fromJson(
          json.decode(
            response,
          ),
        );
        moviesDetailsResponseModel.refresh();
      },
    );
  }

  void _scrollListener() {
    debugPrint(
      scrollController.position.pixels.toString(),
    );
    if (scrollController.position.pixels >= 140) {
      isScrolled.value = true;
      isScrolled.refresh();
    } else {
      isScrolled.value = false;
      isScrolled.refresh();
    }
  }

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      getArguments = Get.arguments as Map<String, dynamic>;
    }
    if (getArguments['id'] != null) {
      await getDetails();
    }
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
