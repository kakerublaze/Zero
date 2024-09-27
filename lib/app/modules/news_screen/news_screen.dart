import 'package:zero/app/core/utils/exports.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
    );
  }
}
