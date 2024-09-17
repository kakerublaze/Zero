import 'package:zero/app/core/utils/exports.dart';

Widget getShimmerPlaceholder({
  double? height,
  double? width,
  Widget? child,
}) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      maxHeight: 460,
    ),
    child: SizedBox(
      height: Get.height * 0.65,
      width: Get.width,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 390,
            ),
            child: SizedBox(
              height: Get.height * 0.5,
              width: Get.width,
              child: Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColor.grey900,
                    highlightColor: AppColor.grey800,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.grey900,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColor.grey800,
                          highlightColor: AppColor.grey700,
                          child: Container(
                            width: Get.width * 0.8,
                            height: 20,
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.grey900,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        10.heightBox,
                        Shimmer.fromColors(
                          baseColor: AppColor.grey800,
                          highlightColor: AppColor.grey700,
                          child: Container(
                            width: Get.width * 0.5,
                            height: 40,
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.grey900,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.heightBox,
          SizedBox(
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: AppColor.grey900,
                  highlightColor: AppColor.grey800,
                  child: Container(
                    height: 50,
                    width: 90,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 10 : 0,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.grey900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
