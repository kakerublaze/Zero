import 'package:zero/app/core/utils/exports.dart';

Widget getHomePageCommonShimmer() {
  return SizedBox(
    width: 150,
    height: 300,
    child: ListView.builder(
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
              Shimmer.fromColors(
                baseColor: AppColor.grey800,
                highlightColor: AppColor.grey700,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: Container(
                    color: AppColor.grey900,
                    height: 220,
                  ),
                ),
              ),
              10.heightBox,
              Shimmer.fromColors(
                baseColor: AppColor.grey800,
                highlightColor: AppColor.grey700,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: Container(
                    height: 20,
                    color: AppColor.grey900,
                  ),
                ).paddingOnly(
                  right: 10,
                ),
              ),
            ],
          ).paddingOnly(
            right: 15,
          ),
        );
      },
    ),
  );
}
