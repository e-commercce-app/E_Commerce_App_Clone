import '../../Export/e_commerce_export.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.gridDelegate,
      this.padding,
      this.scrollDirection = Axis.vertical,
      this.physics});

  final SliverGridDelegate? gridDelegate;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 25.0),
        scrollDirection: scrollDirection,
        gridDelegate: gridDelegate ??
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisExtent: 250),
        physics: physics ??
            const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: itemBuilder);
  }
}
