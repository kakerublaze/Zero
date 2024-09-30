import 'dart:ui';

import '../../core/utils/exports.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      DetailsScreenController(),
    );
    return Scaffold(
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
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: Container(),
    );
  }
}
