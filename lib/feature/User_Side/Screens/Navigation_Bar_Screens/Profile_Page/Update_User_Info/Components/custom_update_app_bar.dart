import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/core/Components/Navigator_Service/navigator.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Profile_Page/Update_User_Info/update_user_main.dart';
import 'package:flutter/cupertino.dart';

class CustomUpdateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomUpdateAppBar({
    required this.widget,
    super.key,
  });

  final UpdateUserInfo widget;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      size: widget.size,
      centerTitle: true,
      title: AppBarSubtitleOne(text: update.toUpperCase()),
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
