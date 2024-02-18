import '../../../Export/e_commerce_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.height,
    // this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    required this.size,
  }) : super(key: key);

  final double? height;
  // final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // toolbarHeight: height ?? 56,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      // leadingWidth: leadingWidth,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        size.height * 0.07,
      );
}
