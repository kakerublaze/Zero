import 'package:zero/app/core/utils/exports.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
