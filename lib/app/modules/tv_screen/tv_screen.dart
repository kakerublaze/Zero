import 'package:zero/app/core/utils/exports.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TVScreenController(),
    );
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        child: Obx(
          () {
            return Column(
              children: [
                controller.isLoading.value
                    ? getTVScreenShimmer()
                    : Expanded(
                        child: GridView.builder(
                          itemCount: controller.asianTvList.length,
                          shrinkWrap: true,
                          controller:
                              Get.find<MainScreenController>().scrollController,
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.44,
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
                  Transform.translate(
                    offset: const Offset(
                      0,
                      -80,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Loading More...',
                            style: TextStyle(
                              color: AppColor.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
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
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
