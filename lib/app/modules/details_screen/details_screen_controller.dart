import 'dart:convert';

import 'package:zero/app/core/utils/exports.dart';

class DetailsScreenController extends GetxController {
  Rx<bool> isScrolled = false.obs;
  final ScrollController scrollController = ScrollController();
  RestServices restServices = RestServices();
  Map<String, dynamic> getArguments = {};
  var token = dotenv.env['token'];
  Rx<MoviesDetailsResponseModel> moviesDetailsResponseModel =
      MoviesDetailsResponseModel().obs;
  Rx<TVDetailsResponseModel> tvDetailsResponseModel =
      TVDetailsResponseModel().obs;

  Future<void> getDetails() async {
    getArguments['origin'] == 'tv'
        ? await restServices
            .getResponse(
            uri: Endpoints.asianTVInfo,
            method: Method.get,
            queryParameters: {
              'id': '${getArguments['id']}',
            },
            token: token,
            isMovie: false,
          )
            .then(
            (response) {
              tvDetailsResponseModel.value = TVDetailsResponseModel.fromJson(
                json.decode(
                  response,
                ),
              );
              tvDetailsResponseModel.refresh();
            },
          )
        : await restServices
            .getResponse(
            uri: '${Endpoints.moviesDetails}/${getArguments['id']}',
            method: Method.get,
            token: token,
            isMovie: true,
          )
            .then(
            (response) {
              moviesDetailsResponseModel.value =
                  MoviesDetailsResponseModel.fromJson(
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
