import 'package:zero/app/core/utils/exports.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NewsScreenController(),
    );
    return SafeArea(
      child: Obx(
        () {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.primary,
            ),
            child: Column(
              children: [
                5.heightBox,
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: ListView.builder(
                    itemCount: controller.newsTypesList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 40,
                        constraints: const BoxConstraints(
                          maxHeight: 40,
                        ),
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 2,
                          bottom: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.grey900,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: controller.selectedIndex.value == index
                              ? Border.all(
                                  color: AppColor.white,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            controller.newsTypesList[index],
                            style: const TextStyle(
                              color: AppColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ).onTap(
                        () {
                          controller.selectedIndex.value = index;
                          if (controller.newsTypesList[index] == 'All') {
                            controller.newsFeedData();
                          } else {
                            controller.newsFeedData(
                              newsType: controller.newsTypesList[index],
                            );
                          }
                          controller.selectedIndex.refresh();
                        },
                      );
                    },
                  ),
                ),
                15.heightBox,
                Expanded(
                  child: controller.isLoadingData.value
                      ? ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom: 80,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColor.grey900,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom:
                                    controller.newsDataList.length - 1 == index
                                        ? 20
                                        : 5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: AppColor.grey800,
                                      highlightColor: AppColor.grey700,
                                      child: Container(
                                        height: 120,
                                        width: Get.width * 0.25,
                                        color: AppColor.grey900,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: AppColor.grey800,
                                        highlightColor: AppColor.grey700,
                                        child: Container(
                                          height: 20,
                                          width: Get.width * 0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.grey900,
                                          ),
                                        ),
                                      ).paddingOnly(
                                        top: 30,
                                        left: 15,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: AppColor.grey800,
                                        highlightColor: AppColor.grey700,
                                        child: Container(
                                          height: 20,
                                          width: Get.width * 0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.grey900,
                                          ),
                                        ),
                                      ).paddingOnly(
                                        top: 5,
                                        left: 15,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: controller.newsDataList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 80,
                            left: 10,
                            right: 10,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom:
                                    controller.newsDataList.length - 1 == index
                                        ? 20
                                        : 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: AppColor.grey900,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    child: ImageHelper(
                                      imagePath: controller
                                              .newsDataList[index].thumbnail ??
                                          '',
                                      width: Get.width * 0.25,
                                      height: 110,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.68,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          controller
                                                  .newsDataList[index].title ??
                                              '',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: AppColor.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ).paddingOnly(
                                          top: 5,
                                          left: 10,
                                          right: 10,
                                          bottom: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            controller.newsDataList[index]
                                                    .uploadedAt ??
                                                '',
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ).paddingOnly(
                                            right: 10,
                                            bottom: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ).onTap(
                              () {
                                Get.toNamed(
                                  Routes.newsDetails,
                                  arguments: {
                                    'id': controller.newsDataList[index].id,
                                    'image': controller
                                        .newsDataList[index].thumbnail,
                                  },
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
