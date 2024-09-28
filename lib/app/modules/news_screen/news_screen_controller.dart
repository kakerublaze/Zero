import 'dart:convert';

import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/data/models/news/news_list_response_model.dart';

class NewsScreenController extends GetxController {
  RestServices restServices = RestServices();
  RxBool isLoadingData = false.obs;
  RxList<NewsResponseList> newsDataList = <NewsResponseList>[].obs;

  Future<void> newsFeedData() async {
    isLoadingData.value = true;
    await restServices
        .getResponse(
      uri: Endpoints.newsData,
      method: Method.get,
    )
        .then(
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
