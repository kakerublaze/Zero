import 'dart:async';
import 'dart:convert';

import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/data/models/celebs/celebs_list_response_model.dart';

class HomeScreenController extends GetxController {
  RestServices restServices = RestServices();
  Rx<int> currentIndex = 0.obs;
  ScrollController sliderController = ScrollController();
  //--> Home Page Data List's Variables
  MoviesResponseModel sliderResponseModel = MoviesResponseModel();
  RxList<MoviesData> sliderData = <MoviesData>[].obs;
  MoviesResponseModel moviesResponseModel = MoviesResponseModel();
  RxList<MoviesData> trendingMoviesData = <MoviesData>[].obs;
  MoviesResponseModel tvSeriesResponseModel = MoviesResponseModel();
  RxList<MoviesData> trendingTVSeriesData = <MoviesData>[].obs;
  CelebsResponseModel celebsResponseModel = CelebsResponseModel();
  RxList<CelebsDetails> trendingCelebsData = <CelebsDetails>[].obs;
  var loadingStates = <String, bool>{}.obs;

  //--> Get Slider Data
  Future<void> getSliderData() async {
    try {
      loadingStates['trending'] = true;
      await restServices.getResponse(
          isMovie: true,
          uri: '${Endpoints.trendingMovies}/day',
          method: Method.get,
          queryParameters: {
            'type': 'Movie',
          }).then(
        (response) {
          sliderResponseModel = MoviesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          sliderData.value = ((sliderResponseModel.results ?? []).length > 7
                  ? sliderResponseModel.results?.sublist(0, 7)
                  : sliderResponseModel.results) ??
              [];
          loadingStates['trending'] = false;
          sliderData.refresh();
        },
      );
    } catch (e) {
      loadingStates['trending'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['trending'] = false;
    }
  }

  //--> Get Trending Movies
  Future<void> getTrendingMovies() async {
    try {
      loadingStates['movies'] = true;
      await restServices.getResponse(
        uri: '${Endpoints.movieSearch}/trending',
        method: Method.get,
        queryParameters: {
          'type': 'Movie',
        },
      ).then(
        (response) {
          moviesResponseModel = MoviesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          trendingMoviesData.value = moviesResponseModel.results ?? [];
          loadingStates['movies'] = false;
          trendingMoviesData.refresh();
        },
      );
    } catch (e) {
      loadingStates['movies'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['movies'] = false;
    }
  }

  //--> Get Trending TV Series
  Future<void> getTrendingTvSeries() async {
    try {
      loadingStates['series'] = true;
      await restServices.getResponse(
        uri: '${Endpoints.movieSearch}/trending',
        method: Method.get,
        queryParameters: {
          'type': 'TV Series',
        },
      ).then(
        (response) {
          tvSeriesResponseModel = MoviesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          trendingTVSeriesData.value = tvSeriesResponseModel.results ?? [];
          loadingStates['series'] = false;
          trendingTVSeriesData.refresh();
        },
      );
    } catch (e) {
      loadingStates['series'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['series'] = false;
    }
  }

  //--> Get Trending Celebs
  Future<void> getTrendingCelebs() async {
    try {
      loadingStates['celebs'] = true;
      await restServices
          .getResponse(
        isMovie: true,
        uri: '/person/popular',
        method: Method.get,
        token: '',
      )
          .then(
        (response) {
          celebsResponseModel = CelebsResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          trendingCelebsData.value = celebsResponseModel.results ?? [];
          loadingStates['celebs'] = false;
          trendingCelebsData.refresh();
        },
      );
    } catch (e) {
      loadingStates['celebs'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['celebs'] = false;
    }
  }

  @override
  Future<void> onInit() async {
    await getSliderData();
    Timer.periodic(
      const Duration(milliseconds: 1500),
      (timer) {
        currentIndex.value = (currentIndex.value + 1) % sliderData.length;
        if (currentIndex.value < 5) {
          sliderController.animateTo(
            (currentIndex * 100).toDouble(),
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeInOut,
          );
        }
      },
    );
    getTrendingMovies();
    getTrendingTvSeries();
    getTrendingCelebs();
    super.onInit();
  }
}
