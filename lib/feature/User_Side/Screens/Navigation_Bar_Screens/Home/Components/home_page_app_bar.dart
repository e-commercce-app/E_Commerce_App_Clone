import '../../../../../../Export/e_commerce_export.dart';

import 'package:e_commerce/core/Components/Navigator_Service/Routes/routes_name.dart';

PreferredSizeWidget homePageAppBar(BuildContext context,
    {Function()? onTap,
    required Widget child,
    Size? size,
    String? currentLocation}) {
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
        AppBarSubtitleOne(
          text: currentLocation ?? "Pakistan Lahore 45",
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
