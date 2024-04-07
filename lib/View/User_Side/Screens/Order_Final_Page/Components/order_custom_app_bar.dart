import 'package:flutter/cupertino.dart';

import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget orderAppBar({Size? size}) {
  return CustomAppBar(
      size: size!,
      leading: AppBarLeadingIconButtonOne(
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
        onTap: () => NavigatorService.goBack(),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Final Order",
        margin: const EdgeInsets.only(left: 40),
      ));
}
