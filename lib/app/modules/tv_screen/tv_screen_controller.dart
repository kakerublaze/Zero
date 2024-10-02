import 'dart:convert';
import 'package:zero/app/core/utils/exports.dart';

class TVScreenController extends GetxController {
  RestServices restServices = RestServices();
  Rx<AsianTvResponseModel> asianTvResponseModel = AsianTvResponseModel().obs;
  RxList<AsianTvDataList> asianTvList = <AsianTvDataList>[].obs;
  RxInt currentPage = 1.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();

  Future<void> getAsianTvData() async {
    if (asianTvResponseModel.value.hasNextPage != null) {
      isLoadingMore.value = true;
    } else {
      isLoading.value = true;
    }
    await restServices.getResponse(
      uri: '${Endpoints.asianTVSearch}/popular',
      method: Method.get,
      queryParameters: {
        'page': currentPage.value.toString(),
      },
    ).then(
      (response) {
        asianTvResponseModel.value = AsianTvResponseModel.fromJson(
          json.decode(response),
        );
        asianTvList.addAll(
          asianTvResponseModel.value.results ?? [],
        );
        currentPage.value += 1;
        isLoading.value = false;
        isLoadingMore.value = false;
        asianTvList.refresh();
      },
    );
  }

  @override
  Future<void> onInit() async {
    await getAsianTvData();
    scrollController.addListener(
      () async {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
            !isLoadingMore.value) {
          await getAsianTvData();
        }
      },
    );
    super.onInit();
  }
}
