import 'package:zero/app/core/utils/exports.dart';
import 'package:zero/app/core/utils/helpers/image_helper.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(
    //   SplashScreenController(),
    //   permanent: true,
    // );
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        child: const Center(
          child: ImageHelper(
            imagePath: ImagePath.appIcon,
            height: 140,
            width: 140,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
