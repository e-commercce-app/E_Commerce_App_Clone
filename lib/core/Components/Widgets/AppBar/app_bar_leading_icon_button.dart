import 'package:e_commerce/Export/e_commerce_export.dart';

class AppBarLeadingIconButtonOne extends StatelessWidget {
  const AppBarLeadingIconButtonOne({
    required this.child,
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Center(
      child: Container(
        height: height * 0.055,
        width: width * 0.12,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Resources.colors.kWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: IconButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          color: Colors.transparent,
          icon: Center(
            child: child,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
