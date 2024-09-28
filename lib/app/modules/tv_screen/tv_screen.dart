import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/modules/tv_screen/tv_screen_controller.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TVScreenController(),
    );
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: Obx(
        () {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: controller.asianTvList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.45,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
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
                    );
                  },
                ),
              ),
              80.heightBox,
            ],
          );
        },
      ),
    );
  }
}
