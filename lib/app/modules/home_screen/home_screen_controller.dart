import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/data/models/animes/trending_anime_response_model.dart';
import 'package:zero/app/data/models/celebs/celebs_list_response_model.dart';
import 'package:zero/app/data/models/series/series_list_response_model.dart';

class HomeScreenController extends GetxController {
  RestServices restServices = RestServices();
  Rx<int> currentIndex = 0.obs;
  ScrollController sliderController = ScrollController();
  //--> Home Page Data List's Variables
  MoviesResponseModel sliderResponseModel = MoviesResponseModel();
  RxList<MoviesData> sliderData = <MoviesData>[].obs;
  MoviesResponseModel popularMoviesResponseModel = MoviesResponseModel();
  RxList<MoviesData> popularMoviesData = <MoviesData>[].obs;
  SeriesResponseModel seriesResponseModel = SeriesResponseModel();
  RxList<SeriesData> trendingSeriesData = <SeriesData>[].obs;
  SeriesResponseModel popularSeriesResponseModel = SeriesResponseModel();
  RxList<SeriesData> popularSeriesData = <SeriesData>[].obs;
  TrendingAnimeResponseModel trendingAnimeResponseModel =
      TrendingAnimeResponseModel();
  RxList<TrendingAnimeData> trendingAnimeData = <TrendingAnimeData>[].obs;
  TrendingAnimeResponseModel popularAnimeResponseModel =
      TrendingAnimeResponseModel();
  RxList<TrendingAnimeData> popularAnimeData = <TrendingAnimeData>[].obs;
  CelebsResponseModel celebsResponseModel = CelebsResponseModel();
  RxList<CelebsDetails> trendingCelebsData = <CelebsDetails>[].obs;
  // Rx<Timer?> sliderTimer = Rx<Timer?>(null);

  var loadingStates = <String, bool>{}.obs;
  var token = dotenv.env['token'];

  //--> Get Slider Data
  Future<void> getSliderData() async {
    try {
      loadingStates['slider'] = true;
      await restServices
          .getResponse(
        isMovie: true,
        uri: '${Endpoints.trendingMovies}/day',
        method: Method.get,
        token: token,
      )
          .then(
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
          loadingStates['slider'] = false;

          // Cancel the existing timer if it's running
          // sliderTimer.value?.cancel();

          // if (sliderData.isNotEmpty &&
          //     Get.find<MainScreenController>().selectedIndex.value == 0) {
          //   sliderTimer.value = Timer.periodic(
          //     const Duration(milliseconds: 1500),
          //     (timer) {
          //       currentIndex.value =
          //           (currentIndex.value + 1) % sliderData.length;
          //       if (currentIndex.value < 5) {
          //         sliderController.animateTo(
          //           (currentIndex * 100).toDouble(),
          //           duration: const Duration(
          //             milliseconds: 500,
          //           ),
          //           curve: Curves.easeInOut,
          //         );
          //       }
          //     },
          //   );
          // }
          sliderData.refresh();
        },
      );
    } catch (e) {
      loadingStates['slider'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['slider'] = false;
    }
  }

  //--> Get Popular Movies
  Future<void> getPopularMovies() async {
    try {
      loadingStates['popMovies'] = true;
      await restServices.getResponse(
        uri: Endpoints.popularMovies,
        method: Method.get,
        token: token,
        isMovie: true,
        queryParameters: {
          'page': '1',
        },
      ).then(
        (response) {
          popularMoviesResponseModel = MoviesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          popularMoviesData.value = popularMoviesResponseModel.results ?? [];
          loadingStates['popMovies'] = false;
          popularMoviesData.refresh();
        },
      );
    } catch (e) {
      loadingStates['popMovies'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['popMovies'] = false;
    }
  }

  //--> Get Trending Series
  Future<void> getTrendingSeries() async {
    try {
      loadingStates['trendingSeries'] = true;
      await restServices
          .getResponse(
        uri: '${Endpoints.trendingSeries}/day',
        method: Method.get,
        token: token,
        isMovie: true,
      )
          .then(
        (response) {
          seriesResponseModel = SeriesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          trendingSeriesData.value = seriesResponseModel.results ?? [];
          loadingStates['trendingSeries'] = false;
          trendingSeriesData.refresh();
        },
      );
    } catch (e) {
      loadingStates['trendingSeries'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['trendingSeries'] = false;
    }
  }

  //--> Get Popular Series
  Future<void> getPopularSeries() async {
    try {
      loadingStates['popularSeries'] = true;
      await restServices
          .getResponse(
        uri: Endpoints.popularSeries,
        method: Method.get,
        token: token,
        isMovie: true,
      )
          .then(
        (response) {
          popularSeriesResponseModel = SeriesResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          popularSeriesData.value = popularSeriesResponseModel.results ?? [];
          loadingStates['popularSeries'] = false;
          popularSeriesData.refresh();
        },
      );
    } catch (e) {
      loadingStates['popularSeries'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['popularSeries'] = false;
    }
  }

  //--> Get Trending Animes
  Future<void> getTrendingAnime() async {
    try {
      loadingStates['trendingAnime'] = true;
      await restServices.getResponse(
        uri: Endpoints.animeSearch,
        method: Method.get,
        queryParameters: {
          'page': '1',
          'perPage': 20.toString(),
          'sort': '["TRENDING_DESC"]',
          'format': 'TV',
        },
      ).then(
        (response) {
          trendingAnimeResponseModel = TrendingAnimeResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          trendingAnimeData.value = trendingAnimeResponseModel.results ?? [];
          loadingStates['trendingAnime'] = false;
          trendingAnimeData.refresh();
        },
      );
    } catch (e) {
      loadingStates['trendingAnime'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['trendingAnime'] = false;
    }
  }

  //--> Get Popular Animes
  Future<void> getPopularAnime() async {
    try {
      loadingStates['popularAnime'] = true;
      await restServices.getResponse(
        uri: Endpoints.animeSearch,
        method: Method.get,
        queryParameters: {
          'page': '1',
          'perPage': 20.toString(),
          'sort': '["POPULARITY_DESC"]',
          'format': 'TV',
        },
      ).then(
        (response) {
          popularAnimeResponseModel = TrendingAnimeResponseModel.fromJson(
            json.decode(
              response,
            ),
          );

          popularAnimeData.value = popularAnimeResponseModel.results ?? [];
          loadingStates['popularAnime'] = false;
          popularAnimeData.refresh();
        },
      );
    } catch (e) {
      loadingStates['popularAnime'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['popularAnime'] = false;
    }
  }

  //--> Get Trending Celebs
  Future<void> getTrendingCelebs() async {
    try {
      loadingStates['celebs'] = true;
      await restServices
          .getResponse(
        isMovie: true,
        uri: '${Endpoints.trendingCelebs}/day',
        method: Method.get,
        token: token,
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
    getPopularMovies();
    getTrendingSeries();
    getPopularSeries();
    getTrendingAnime();
    getPopularAnime();
    getTrendingCelebs();
    super.onInit();
  }
}
