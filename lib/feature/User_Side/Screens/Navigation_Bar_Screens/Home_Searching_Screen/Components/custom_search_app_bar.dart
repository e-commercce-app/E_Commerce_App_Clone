import 'package:flutter/cupertino.dart';

import '../../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget searchingAppBar({Size? size}) {
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
        text: searching,
        margin: const EdgeInsets.only(left: 40),
      ));
}
