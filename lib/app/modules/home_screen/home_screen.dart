import 'package:carousel_slider/carousel_slider.dart';
import 'package:zero/app/core/constants/endpoints.dart';
import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/global_widgets/shimmers/home_page_common_shimmer_widget.dart';
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
              controller.loadingStates['slider'] == true
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
                                  imagePath: controller.sliderData.isNotEmpty
                                      ? '${Endpoints.imageBaseUrl}${controller.sliderData[controller.currentIndex.value].posterPath ?? ''}'
                                      : '',
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
                                        controller.sliderData.isNotEmpty
                                            ? controller
                                                    .sliderData[controller
                                                        .currentIndex.value]
                                                    .title ??
                                                ''
                                            : '',
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
                                            text:
                                                controller.sliderData.isNotEmpty
                                                    ? controller
                                                        .sliderData[controller
                                                            .currentIndex.value]
                                                        .voteAverage
                                                        ?.toStringAsFixed(2)
                                                    : '-/-',
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
              if (controller.sliderData.isNotEmpty)
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Container(
                    height: 70,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: AppColor.transparent,
                    ),
                    child: CarouselSlider.builder(
                      itemCount: controller.sliderData.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3,
                              color: controller.currentIndex.value == index
                                  ? AppColor.secondary
                                  : AppColor.transparent,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ImageHelper(
                              width: 90,
                              height: 60,
                              imageHeight: 25,
                              imageWidth: 25,
                              imagePath:
                                  '${Endpoints.imageBaseUrl}${controller.sliderData[index].posterPath ?? ''}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ).paddingOnly(left: 10);
                      },
                      options: CarouselOptions(
                        height: 70,
                        aspectRatio: 1.3,
                        viewportFraction: 0.25,
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                            seconds: 3), // Adjust for slide speed
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value = index;
                          controller.currentIndex.refresh();
                        },
                      ),
                    ),
                  ),
                ),
              10.heightBox,
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
                  // --> Popular Movies
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['popMovies'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.popularMoviesData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${Endpoints.imageBaseUrl}${controller.popularMoviesData[index].posterPath}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller
                                              .popularMoviesData[index].title ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              ).onTap(
                                () {
                                  Get.toNamed(
                                    Routes.detailsScreen,
                                    arguments: {
                                      'id': controller
                                          .popularMoviesData[index].id,
                                      'title': controller
                                          .popularMoviesData[index].title,
                                    },
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  30.heightBox,
                  // --> Trending Series
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Trending Series',
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['trendingSeries'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.trendingSeriesData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${Endpoints.imageBaseUrl}${controller.trendingSeriesData[index].posterPath}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller
                                              .trendingSeriesData[index].name ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              );
                            },
                          ),
                  ),
                  30.heightBox,
                  // --> Popular Series
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Popular Series',
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['popularSeries'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.popularSeriesData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${Endpoints.imageBaseUrl}${controller.popularSeriesData[index].posterPath}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller
                                              .popularSeriesData[index].name ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              );
                            },
                          ),
                  ),
                  30.heightBox,
                  // --> Trending Anime
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Trending Anime',
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['trendingAnime'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.trendingAnimeData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${controller.trendingAnimeData[index].image}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller.trendingAnimeData[index].title
                                              ?.english ??
                                          controller.trendingAnimeData[index]
                                              .title?.userPreferred ??
                                          controller.trendingAnimeData[index]
                                              .title?.native ??
                                          controller.trendingAnimeData[index]
                                              .title?.romaji ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              );
                            },
                          ),
                  ),
                  30.heightBox,
                  // --> Popular Anime's
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Popular Anime',
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['popularAnime'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.popularAnimeData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${controller.popularAnimeData[index].image}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller.popularAnimeData[index].title
                                              ?.english ??
                                          controller.popularAnimeData[index]
                                              .title?.userPreferred ??
                                          controller.popularAnimeData[index]
                                              .title?.native ??
                                          controller.popularAnimeData[index]
                                              .title?.romaji ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              );
                            },
                          ),
                  ),
                  30.heightBox,
                  // --> Trending Celebs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Trending Celeb\'s',
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
                  ).paddingOnly(
                    left: 10,
                    right: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: controller.loadingStates['celebs'] == true
                        ? getHomePageCommonShimmer()
                        : ListView.builder(
                            itemCount: controller.trendingCelebsData.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 10,
                              left: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: ImageHelper(
                                        imagePath:
                                            '${Endpoints.imageBaseUrl}${controller.trendingCelebsData[index].profilePath}',
                                        height: 220,
                                        fit: BoxFit.fill,
                                      ),
                                    ).paddingOnly(
                                      bottom: 10,
                                    ),
                                    Text(
                                      controller
                                              .trendingCelebsData[index].name ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  right: 15,
                                ),
                              );
                            },
                          ),
                  ),
                  120.heightBox,
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
