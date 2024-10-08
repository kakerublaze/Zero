import 'dart:ui';

import 'package:zero/app/core/utils/exports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      MainScreenController(),
    );
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: controller.selectedIndex.value == 0
            ? controller.isScrolled.value
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
                          title: const Text(
                            'Zero',
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
                : null
            : PreferredSize(
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
                        controller.tabsName[controller.selectedIndex.value],
                      ),
                      titleTextStyle: const TextStyle(
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
        body: Stack(
          children: [
            controller.selectedIndex.value == 0
                ? SingleChildScrollView(
                    controller: controller.selectedIndex.value == 0
                        ? controller.scrollController
                        : null,
                    child: controller.tabs[controller.selectedIndex.value],
                  )
                : controller.tabs[controller.selectedIndex.value],
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.black.withOpacity(0.7),
                          AppColor.black.withOpacity(0.7),
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      border: Border.all(
                        width: 1.5,
                        color: AppColor.black.withOpacity(0.9),
                      ),
                    ),
                    child: BottomNavigationBar(
                      onTap: (index) {
                        if (index == 4) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: 'This Page is Still in development :(',
                              backgroundColor: AppColor.red,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            ),
                          );
                          return;
                        }
                        controller.selectedIndex.value = index;
                        // controller.scrollController.animateTo(
                        //   controller.scrollController.position.minScrollExtent,
                        //   duration: const Duration(milliseconds: 500),
                        //   curve: Curves.fastLinearToSlowEaseIn,
                        // );
                        controller.selectedIndex.refresh();
                        // if (controller.selectedIndex.value != 0) {
                        //   controller.selectedIndex.listen(
                        //     (index) {
                        //       if (index != 0) {
                        //         Get.find<HomeScreenController>()
                        //             .sliderTimer
                        //             .value
                        //             ?.cancel();
                        //       }
                        //     },
                        //   );
                        // } else {
                        //   Get.find<HomeScreenController>().sliderTimer.value =
                        //       Timer.periodic(
                        //     const Duration(milliseconds: 1500),
                        //     (timer) {
                        //       Get.find<HomeScreenController>()
                        //           .currentIndex
                        //           .value = (Get.find<HomeScreenController>()
                        //                   .currentIndex
                        //                   .value +
                        //               1) %
                        //           Get.find<HomeScreenController>()
                        //               .sliderData
                        //               .length;
                        //       if (Get.find<HomeScreenController>()
                        //               .currentIndex
                        //               .value <
                        //           5) {
                        //         Get.find<HomeScreenController>()
                        //             .sliderController
                        //             .animateTo(
                        //               (Get.find<HomeScreenController>()
                        //                           .currentIndex *
                        //                       100)
                        //                   .toDouble(),
                        //               duration:
                        //                   const Duration(milliseconds: 500),
                        //               curve: Curves.easeInOut,
                        //             );
                        //       }
                        //     },
                        //   );
                        // }
                      },
                      elevation: 0.0,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: AppColor.white,
                      unselectedItemColor: AppColor.white,
                      selectedLabelStyle: const TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                      ),
                      selectedFontSize: 16,
                      unselectedFontSize: 16,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      currentIndex: controller.selectedIndex.value,
                      backgroundColor: Colors.transparent,
                      items: [
                        BottomNavigationBarItem(
                          icon: controller.selectedIndex.value == 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white30,
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.homeSelected,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.home,
                                    width: 24,
                                    height: 24,
                                    color: AppColor.white,
                                  ),
                                ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: controller.selectedIndex.value == 1
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white30,
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.animeSelected,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.anime,
                                    width: 24,
                                    height: 24,
                                    color: AppColor.white,
                                  ),
                                ),
                          label: 'TV',
                        ),
                        BottomNavigationBarItem(
                          icon: controller.selectedIndex.value == 2
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white30,
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.exploreSelected,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.explore,
                                    width: 24,
                                    height: 24,
                                    color: AppColor.white,
                                  ),
                                ),
                          label: 'Explore',
                        ),
                        BottomNavigationBarItem(
                          icon: controller.selectedIndex.value == 3
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white30,
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.newsSelected,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.news,
                                    width: 24,
                                    height: 24,
                                    color: AppColor.white,
                                  ),
                                ),
                          label: 'News',
                        ),
                        BottomNavigationBarItem(
                          icon: controller.selectedIndex.value == 4
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white30,
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.profileSelected,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Image.asset(
                                    ImagePath.profile,
                                    width: 24,
                                    height: 24,
                                    color: AppColor.white,
                                  ),
                                ),
                          label: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
