import 'package:zero/app/core/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(
      SplashScreenController(),
      permanent: true,
    );
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        child: Center(
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
              height: 140,
              width: 140,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
