import '../../../Export/e_commerce_export.dart';

class AppBarLeadingIconButtonOne extends StatelessWidget {
  const AppBarLeadingIconButtonOne({
    super.key,
    this.onTap,
    required this.child,
  });
  final VoidCallback? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Center(
      child: Container(
        height: height * 0.055,
        width: width * 0.12,
        padding: const EdgeInsets.all(0),
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
