import 'dart:convert';

import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/data/models/asian_tv/asian_tv_response_model.dart';

class TVScreenController extends GetxController {
  RestServices restServices = RestServices();
  Rx<AsianTvResponseModel> asianTvResponseModel = AsianTvResponseModel().obs;
  RxList<AsianTvDataList> asianTvList = <AsianTvDataList>[].obs;

  Future<void> getAsianTvData() async {
    await restServices
        .getResponse(
      uri: '${Endpoints.asianTVSearch}/popular',
      method: Method.get,
    )
        .then(
      (response) {
        asianTvResponseModel.value = AsianTvResponseModel.fromJson(
          json.decode(response),
        );

        asianTvList.value = asianTvResponseModel.value.results ?? [];
        asianTvList.refresh();
      },
    );
  }

  @override
  Future<void> onInit() async {
    await getAsianTvData();
    super.onInit();
  }
}
