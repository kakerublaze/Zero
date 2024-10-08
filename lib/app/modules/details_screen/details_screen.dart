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
        return SafeArea(
          child: Scaffold(
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
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          automaticallyImplyLeading: false,
                          leading: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 24,
                            weight: 800,
                            color: AppColor.white,
                          ).onTap(
                            () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
            body: Container(
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return AppColor.getStartedGradient.createShader(
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
                                controller.tvDetailsResponseModel.value.image ??
                                    '',
                            height: 150,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(
                                0.3,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                              weight: 800,
                              color: AppColor.white,
                            ).onTap(
                              () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ],
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
                              imagePath: controller
                                      .tvDetailsResponseModel.value.image ??
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
                                  controller
                                          .tvDetailsResponseModel.value.title ??
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
                                      TextSpan(
                                        text: controller.tvDetailsResponseModel
                                                .value.releaseDate ??
                                            '--/--',
                                        style: const TextStyle(
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
                                        text: controller.tvDetailsResponseModel
                                            .value.status,
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
                      removeHtmlTags(
                        controller.tvDetailsResponseModel.value.description ??
                            '--/--',
                      ),
                      maxLines: controller.isExpanded.value ? null : 3,
                      overflow: controller.isExpanded.value
                          ? null
                          : TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColor.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ).paddingOnly(
                      left: 15,
                      right: 15,
                    ),
                    10.heightBox,
                    Center(
                      child: Text(
                        controller.isExpanded.value ? 'Show Less' : 'Show More',
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ).onTap(
                        () {
                          controller.isExpanded.value =
                              !controller.isExpanded.value;
                        },
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
                                (controller
                                        .tvDetailsResponseModel.value.genres ??
                                    [])[index],
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ).paddingOnly(
                              left: index == 0 ? 15 : 0,
                              right: 10,
                            );
                          },
                        ),
                      ),
                    ),
                    15.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Episodes',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ).paddingOnly(
                          left: 15,
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
                        )
                            .paddingOnly(
                          right: 15,
                        )
                            .onTap(
                          () {
                            Get.toNamed(
                              Routes.episodesScreen,
                              arguments: {
                                'response':
                                    controller.tvDetailsResponseModel.value,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    10.heightBox,
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount:
                            (controller.tvDetailsResponseModel.value.episodes ??
                                            [])
                                        .length >
                                    10
                                ? 10
                                : (controller.tvDetailsResponseModel.value
                                            .episodes ??
                                        [])
                                    .length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Drama Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Container(
                                  height: 150,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: AppColor.black,
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: ShaderMask(
                                          shaderCallback: (bounds) {
                                            return LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: const [
                                                0.4,
                                                0.7,
                                              ],
                                              colors: [
                                                AppColor.secondary,
                                                AppColor.secondaryDark,
                                              ],
                                            ).createShader(bounds);
                                          },
                                          child: ImageHelper(
                                            imagePath: ImagePath.appIcon,
                                            color: AppColor.secondary,
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(
                                            5,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.white.withOpacity(
                                              0.3,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.play_arrow_rounded,
                                            size: 32,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              8.heightBox,
                              SizedBox(
                                width: 250,
                                child: Text(
                                  controller.tvDetailsResponseModel.value
                                          .episodes?[index].title ??
                                      '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ).paddingOnly(
                                left: 5,
                              ),
                            ],
                          ).paddingOnly(
                            right: 8,
                          );
                        },
                      ),
                    ),
                    20.heightBox,
                    if (controller.tvDetailsResponseModel.value.trailer?.id !=
                        null)
                      const Text(
                        'Trailers',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ).paddingOnly(
                        left: 15,
                      ),
                    15.heightBox,
                    if (controller.tvDetailsResponseModel.value.trailer?.id !=
                        null)
                      YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: controller.youtubePlayerController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: AppColor.secondaryDark,
                          progressColors: ProgressBarColors(
                            playedColor: AppColor.secondaryDark,
                            backgroundColor:
                                AppColor.secondary.withOpacity(0.9),
                            bufferedColor: AppColor.secondary,
                            handleColor: AppColor.secondaryDark,
                          ),
                          topActions: <Widget>[
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                controller
                                    .youtubePlayerController.metadata.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                controller.muted.value
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () {
                                controller.toggleMute();
                              },
                            ),
                          ],
                          onReady: () {
                            controller.youtubePlayerController
                                .addListener(controller.listener);
                          },
                          onEnded: (data) {
                            controller.youtubePlayerController.pause();
                          },
                        ),
                        onExitFullScreen: () {
                          SystemChrome.setPreferredOrientations(
                            [
                              DeviceOrientation.portraitUp,
                            ],
                          );
                        },
                        onEnterFullScreen: () {
                          controller.youtubePlayerController
                              .toggleFullScreenMode();
                        },
                        builder: (context, player) {
                          return player.paddingOnly(
                            left: 15,
                            right: 15,
                          );
                        },
                      ),
                    30.heightBox,
                    const Text(
                      'Cast',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ).paddingOnly(
                      left: 15,
                    ),
                    SizedBox(
                      height: 300,
                      width: Get.width,
                      child: controller.loadingStates['celebs'] == true
                          ? getHomePageCommonShimmer()
                          : ListView.builder(
                              itemCount: (controller.tvDetailsResponseModel
                                          .value.characters ??
                                      [])
                                  .length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 15,
                                left: 15,
                              ),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var characterData = (controller
                                        .tvDetailsResponseModel
                                        .value
                                        .characters ??
                                    [])[index];
                                return SizedBox(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        child: ImageHelper(
                                          imagePath: characterData.image ?? '',
                                          height: 220,
                                          fit: BoxFit.fill,
                                        ),
                                      ).paddingOnly(
                                        bottom: 10,
                                      ),
                                      Text(
                                        characterData.name?.split('(').first ??
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
                    80.heightBox,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
