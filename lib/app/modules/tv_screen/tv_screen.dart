import 'package:zero/app/core/utils/exports.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TVScreenController(),
    );
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: Obx(
        () {
          return Column(
            children: [
              Expanded(
                child: controller.isLoading.value
                    ? getTVScreenShimmer()
                    : GridView.builder(
                        itemCount: controller.asianTvList.length,
                        shrinkWrap: true,
                        controller: controller.scrollController,
                        padding: const EdgeInsets.only(
                          top: 90,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.45,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.asianTvList[index];
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath: item.image ?? '',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              10.heightBox,
                              Text(
                                item.title ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ).onTap(
                            () {
                              Get.toNamed(
                                Routes.detailsScreen,
                                arguments: {
                                  'id': item.id,
                                  'origin': 'tv',
                                  'title': item.title,
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
              if (controller.isLoadingMore.value)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Loading More...',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CircularProgressIndicator(
                      color: AppColor.secondaryDark,
                      strokeWidth: 3,
                    ).paddingOnly(
                      left: 10,
                      top: 10,
                      bottom: 10,
                    ),
                  ],
                ),
              80.heightBox,
            ],
          );
        },
      ),
    );
  }
}
