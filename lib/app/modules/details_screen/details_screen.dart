import 'dart:ui';

import '../../core/utils/exports.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      DetailsScreenController(),
    );
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: AppColor.primary,
          appBar: controller.isScrolled.value
              ? PreferredSize(
                  preferredSize: Size(
                    Get.width,
                    60,
                  ),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: AppBar(
                        backgroundColor: AppColor.black.withOpacity(
                          0.8,
                        ),
                        elevation: 0.0,
                        title: Text(
                          controller.getArguments['title'] ?? '',
                        ),
                        titleTextStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                )
              : null,
          body: Container(
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return AppColor.cardsGradientColor.createShader(
                      Rect.fromLTRB(
                        0,
                        0,
                        Get.width,
                        rect.height,
                      ),
                    );
                  },
                  blendMode: BlendMode.dstOut,
                  child: ImageHelper(
                    imagePath:
                        controller.tvDetailsResponseModel.value.image ?? '',
                    height: 150,
                    width: Get.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        child: ImageHelper(
                          imagePath:
                              controller.tvDetailsResponseModel.value.image ??
                                  '',
                          height: 220,
                          width: 160,
                          fit: BoxFit.fill,
                        ),
                      ),
                      20.widthBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.tvDetailsResponseModel.value.title ??
                                  '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColor.white,
                                fontSize: 20,
                              ),
                            ),
                            15.heightBox,
                            // --> Type
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: const Icon(
                                      Icons.tv_outlined,
                                      size: 20,
                                      weight: 800,
                                      color: AppColor.white,
                                    ).paddingOnly(
                                      right: 10,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'TV',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.heightBox,
                            // --> Minutes of content
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: const Icon(
                                      Icons.watch_later_outlined,
                                      size: 20,
                                      weight: 800,
                                      color: AppColor.white,
                                    ).paddingOnly(
                                      right: 10,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'N/A --/--',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.heightBox,
                            // --> Status
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: const Icon(
                                      Icons.wifi_tethering_rounded,
                                      size: 20,
                                      weight: 800,
                                      color: AppColor.white,
                                    ).paddingOnly(
                                      right: 10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller
                                        .tvDetailsResponseModel.value.status,
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                ),
                10.heightBox,
                Text(
                  controller.tvDetailsResponseModel.value.description ?? '',
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                20.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      (controller.tvDetailsResponseModel.value.genres ?? [])
                          .length,
                      (index) {
                        return Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.white,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Text(
                            (controller.tvDetailsResponseModel.value.genres ??
                                [])[index],
                            style: const TextStyle(
                              color: AppColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ).paddingOnly(
                          left: 5,
                          right: 5,
                        );
                      },
                    ),
                  ),
                ),
                15.heightBox,
                const Text(
                  'Trailers',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
