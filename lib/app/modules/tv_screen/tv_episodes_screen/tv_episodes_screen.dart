import 'package:url_launcher/url_launcher.dart';
import 'package:zero/app/core/utils/exports.dart';

class TvEpisodesScreen extends StatelessWidget {
  const TvEpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TvEpisodesScreenController(),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.black.withOpacity(
            0.8,
          ),
          elevation: 0.0,
          title: Text(
            controller.showDetails.title ?? '',
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
        body: ListView.builder(
          itemCount: (controller.showDetails.episodes ?? []).length,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
              constraints: const BoxConstraints(
                maxHeight: 250,
              ),
              padding: EdgeInsets.only(
                top: index == 0 ? 20 : 0,
                bottom: 20,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    child: ImageHelper(
                      imagePath: controller.showDetails.image ?? '',
                      width: Get.width * 0.3,
                      height: Get.height * 0.25,
                    ),
                  ),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.showDetails.episodes?[index].title ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        15.heightBox,
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Release Date :  ',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Text(
                                  (controller.showDetails.episodes?[index]
                                              .releaseDate ??
                                          '')
                                      .split(' ')
                                      .first,
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        5.heightBox,
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text: 'Type :  ',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Text(
                                    (controller.showDetails.episodes?[index]
                                            .subType ??
                                        ''),
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                )),
                          ]),
                        ),
                        5.heightBox,
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Web Link :  ',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Text(
                                  'Link',
                                  style: TextStyle(
                                    color: AppColor.secondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ).onTap(
                                  () async {
                                    if (await canLaunchUrl(
                                      Uri.parse(controller.showDetails
                                              .episodes?[index].url ??
                                          ''),
                                    )) {
                                      await launchUrl(
                                        Uri.parse(controller.showDetails
                                                .episodes?[index].url ??
                                            ''),
                                      );
                                    }
                                  },
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.link,
                                  color: AppColor.secondary,
                                  size: 28,
                                  weight: 800,
                                ).onTap(
                                  () async {
                                    if (await canLaunchUrl(
                                      Uri.parse(controller.showDetails
                                              .episodes?[index].url ??
                                          ''),
                                    )) {
                                      await launchUrl(
                                        Uri.parse(controller.showDetails
                                                .episodes?[index].url ??
                                            ''),
                                      );
                                    }
                                  },
                                ).paddingOnly(
                                  left: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        5.heightBox,
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
