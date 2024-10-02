import 'dart:convert';
import 'package:zero/app/core/utils/exports.dart';

class NewsScreenController extends GetxController {
  RestServices restServices = RestServices();
  RxBool isLoadingData = false.obs;
  RxList<NewsResponseList> newsDataList = <NewsResponseList>[].obs;
  RxInt selectedIndex = 0.obs;
  RxList<String> newsTypesList = <String>[
    "All",
    "Anime",
    "Animation",
    "Manga",
    "Games",
    "Novels",
    "Live-action",
    "Covid-19",
    "Industry",
    "Music",
    "People",
    "Merch",
    "Events",
  ].obs;

  Future<void> newsFeedData({String? newsType}) async {
    isLoadingData.value = true;
    await restServices.getResponse(
      uri: Endpoints.newsData,
      method: Method.get,
      queryParameters: {
        'topic': (newsType ?? '').toLowerCase(),
      },
    ).then(
      (response) {
        if (response != '') {
          newsDataList.value = (json.decode(response) as List)
              .map(
                (item) => NewsResponseList.fromJson(
                  item,
                ),
              )
              .toList();
          isLoadingData.value = false;
          newsDataList.refresh();
        }
      },
    );
  }

  @override
  Future<void> onInit() async {
    await newsFeedData();
    super.onInit();
  }
}
