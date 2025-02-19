import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:flutter/cupertino.dart';

PreferredSizeWidget orderAppBar({Size? size}) {
  return CustomAppBar(
      size: size!,
      leading: AppBarLeadingIconButtonOne(
        onTap: NavigatorService.goBack,
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
      ),
      centerTitle: true,
      title: AppBarSubtitleOne(
        text: finalOrder,
        margin: const EdgeInsets.only(left: 40),
      ),);
}
