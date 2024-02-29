import 'package:e_commerce/Components/Widgets/custom_image_view.dart';

import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_subtitle_two.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget homePageAppBar(BuildContext context,
    {Function()? onTap, required Widget child, Size? size}) {
  return CustomAppBar(
    size: size!,
    leading: AppBarLeadingIconButtonOne(
      onTap: onTap,
      child: child,
    ),
    centerTitle: true,
    title: Column(
      children: [
        AppbarSubtitleTwo(
          text: "Store Location",
          padding: const EdgeInsets.symmetric(horizontal: 66),
        ),
        // Some Space
        const CustomSizedBox(
          heightRatio: 0.004,
        ),
        AppbarSubtitleOne(
          text: "Pakistan Lahore 45",
          margin: const EdgeInsets.only(left: 40),
        ),
      ],
    ),
    actions: [
      AppBarLeadingIconButtonOne(
          onTap: () {
            // ! LogOut Button
            // FirebaseServices.auth.signOut().then((value) {
            //   Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
            // Navigator.pop(context);
            // });
            NavigatorService.pushNamed(RoutesName.addToCartScreen);
          },
          child: CustomImageView(
            imagePath: Resources.imagePath.trolley,
          )),
      // Some Space
      const CustomSizedBox(
        widthRatio: 0.04,
      ),
    ],
  );
}
