import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
    this.widthRatio,
    this.heightRatio,
    this.child,
  });
  final num? heightRatio;
  final num? widthRatio;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widthRatio ?? 0.01),
      height: MediaQuery.of(context).size.height * (heightRatio ?? 0.01),
      child: child,
    );
  }
}
