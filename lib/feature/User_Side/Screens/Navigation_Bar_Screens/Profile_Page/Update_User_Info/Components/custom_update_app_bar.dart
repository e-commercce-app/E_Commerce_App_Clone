import 'package:flutter/cupertino.dart';

import '../../../../../../../Export/e_commerce_export.dart';
import '../update_user_main.dart';

class CustomUpdateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomUpdateAppBar({
    super.key,
    required this.widget,
  });

  final UpdateUserInfo widget;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      size: widget.size,
      centerTitle: true,
      title: AppbarSubtitleOne(text: update.toUpperCase()),
      leading: AppBarLeadingIconButtonOne(
          child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => NavigatorService.goBack(),
        child: Icon(CupertinoIcons.arrow_left,
            size: 30, color: Resources.colors.kBlack),
      )),
    );
  }

  @override
  Size get preferredSize => Size(widget.size.width, widget.size.height * 0.07);
}
