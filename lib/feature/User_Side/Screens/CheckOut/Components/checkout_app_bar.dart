import 'package:flutter/cupertino.dart';

import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget checkOutAppBar({Size? size}) {
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
      title: AppBarSubtitleOne(
        text: "CheckOut",
        margin: const EdgeInsets.only(left: 40),
      ));
}
