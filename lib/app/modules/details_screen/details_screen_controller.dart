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
  late YoutubePlayerController youtubePlayerController;
  var isPlayerReady = false.obs;
  var videoMetaData = const YoutubeMetaData().obs;
  var playerState = PlayerState.unknown.obs;
  var muted = false.obs;
  var isExpanded = false.obs;
  RxMap<String, bool> loadingStates = <String, bool>{}.obs;

  Future<void> getDetails() async {
    loadingStates['data'] = true;
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
    loadingStates['data'] = false;
    loadingStates.refresh();
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

  void listener() {
    if (isPlayerReady.value &&
        youtubePlayerController.value.isFullScreen == false) {
      playerState.value = youtubePlayerController.value.playerState;
      videoMetaData.value = youtubePlayerController.metadata;
    }
  }

  void toggleMute() {
    if (muted.value) {
      youtubePlayerController.unMute();
    } else {
      youtubePlayerController.mute();
    }
    muted.value = !muted.value;
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      getArguments = Get.arguments as Map<String, dynamic>;
    }
    if (getArguments['id'] != null) {
      await getDetails();
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: tvDetailsResponseModel.value.trailer?.id ?? '',
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: true,
          controlsVisibleAtStart: true,
          loop: false,
          isLive: false,
          forceHD: true,
          enableCaption: true,
        ),
      )..addListener(listener);
    }
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
