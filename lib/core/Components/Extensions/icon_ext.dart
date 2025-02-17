part of 'extension.dart';

extension CustomIcon on IconData {
  Widget toCustomIcon({
    Color color = Colors.grey,
    double? size,
    Key? key,
    bool applyTextScaling = false,
    double? fill,
    int? grade,
    String? semanticLabel,
    double? opticalSize,
    List<Shadow>? shadows,
    TextDirection? textDirection,
    FontWeight? weight,
  }) {
    return Icon(
      this,
      key: key,
      color: color,
      size: size,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: shadows,
    );
  }
}
