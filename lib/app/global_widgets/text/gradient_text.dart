import 'package:zero/app/core/utils/exports.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.stops,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final List<Color> gradient;
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: gradient,
        stops: stops ??
            [
              0.3,
              0.7,
            ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          bounds.width,
          bounds.height,
        ),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
