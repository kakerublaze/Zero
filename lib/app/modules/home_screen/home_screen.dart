import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/core/utils/helpers/image_helper.dart';
import 'package:zero/app/global_widgets/shimmers/home_slider_shimmer_widget.dart';
import 'package:zero/app/global_widgets/text/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      HomeScreenController(),
    );
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.primary,
          ),
          child: Column(
            children: [
              controller.loadingStates['trending'] == true
                  ? getShimmerPlaceholder()
                  : Stack(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 390,
                          ),
                          child: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return AppColor.cardsGradientColor
                                      .createShader(
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
                                  height: Get.height * 0.5,
                                  width: Get.width,
                                  imagePath: controller
                                          .sliderData[
                                              controller.currentIndex.value]
                                          .image ??
                                      '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // Don\'t Remove this code
                              // Positioned(
                              //   top: 20,
                              //   left: 20,
                              //   child: ShaderMask(
                              //     shaderCallback: (bounds) {
                              //       return LinearGradient(
                              //         begin: Alignment.topLeft,
                              //         end: Alignment.bottomRight,
                              //         stops: const [
                              //           0.4,
                              //           0.7,
                              //         ],
                              //         colors: [
                              //           AppColor.secondary,
                              //           AppColor.secondaryDark,
                              //         ],
                              //       ).createShader(bounds);
                              //     },
                              //     child: ImageHelper(
                              //       imagePath: ImagePath.appIcon,
                              //       color: AppColor.secondary,
                              //       height: 50,
                              //       width: 50,
                              //       fit: BoxFit.contain,
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                bottom: 25,
                                left: 20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.9,
                                      child: Text(
                                        controller
                                                .sliderData[controller
                                                    .currentIndex.value]
                                                .title ??
                                            '',
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    5.heightBox,
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: const ImageHelper(
                                              imagePath: ImagePath.imdb,
                                              width: 40,
                                              height: 20,
                                            ).paddingOnly(
                                              right: 10,
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller
                                                .sliderData[controller
                                                    .currentIndex.value]
                                                .rating
                                                ?.toStringAsFixed(2),
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    10.heightBox,
                                    Container(
                                      width: Get.width * 0.5,
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          stops: const [
                                            0.2,
                                            0.7,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColor.secondary,
                                            AppColor.secondaryDark,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Watch Now',
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              5.heightBox,
              SizedBox(
                height: 70,
                width: Get.width,
                child: ListView.builder(
                  controller: controller.sliderController,
                  itemCount: controller.sliderData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          width: 3,
                          color: controller.currentIndex.value == index
                              ? AppColor.secondary
                              : AppColor.transparent,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: ImageHelper(
                          width: 90,
                          height: 60,
                          imagePath: controller.sliderData[index].image ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ).paddingOnly(
                      left: 10,
                    );
                  },
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.sliderData.asMap().entries.map(
                  (entry) {
                    int index = entry.key;
                    double width;
                    if (controller.currentIndex.value == index) {
                      width = 35.0;
                    } else if (controller.currentIndex.value - 1 == index ||
                        controller.currentIndex.value + 1 == index) {
                      width = 20.0;
                    } else {
                      width = 10.0;
                    }

                    return GestureDetector(
                      onTap: () {
                        controller.currentIndex.value = index;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: width,
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: controller.currentIndex.value == index
                              ? Colors.blueAccent
                              : Colors.white.withOpacity(0.2),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              20.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Popular Movies',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GradientText(
                        'See all',
                        gradient: [
                          AppColor.secondary,
                          AppColor.secondaryDark,
                        ],
                        stops: const [
                          0.3,
                          0.7,
                        ],
                      ),
                    ],
                  ),
                  
                ],
              ).paddingOnly(
                left: 10,
                right: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
