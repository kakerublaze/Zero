import 'package:zero/app/core/utils/exports.dart';

Widget getTVScreenShimmer() {
  return GridView.builder(
    padding: const EdgeInsets.only(
      top: 90,
    ),
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.45,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ),
    itemCount: 45,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: AppColor.grey800,
              highlightColor: AppColor.grey700,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.grey900,
                  ),
                  height: 200,
                  width: double.infinity,
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
                  height: 15,
                  color: AppColor.grey900,
                ),
              ),
            ),
            5.heightBox,
            Shimmer.fromColors(
              baseColor: AppColor.grey800,
              highlightColor: AppColor.grey700,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: Container(
                  height: 15,
                  color: AppColor.grey900,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
