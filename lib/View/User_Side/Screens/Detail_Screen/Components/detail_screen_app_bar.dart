import 'package:flutter/cupertino.dart';

import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget homePageAppBar(BuildContext context, {Size? size}) {
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
      text: "Men's Shoes",
      margin: const EdgeInsets.only(left: 40),
    ),
    actions: [
      AppBarLeadingIconButtonOne(
          onTap: () {
            // ! LogOut Button
            // FirebaseServices.auth.signOut().then((value) {
            //   Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
            // Navigator.pop(context);
            // });
          },
          child: Icon(
            Icons.shopping_cart,
            color: Resources.colors.kGray600,
          )),
      // Some Space
      const CustomSizedBox(
        widthRatio: 0.04,
      ),
    ],
  );
}
