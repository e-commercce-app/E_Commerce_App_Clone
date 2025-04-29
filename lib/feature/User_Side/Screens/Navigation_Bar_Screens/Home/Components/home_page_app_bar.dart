import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Notification/notification_screen.dart';

PreferredSizeWidget homePageAppBar(
  BuildContext context, {
  required Widget child,
  void Function()? onTap,
  Size? size,
  String? currentLocation,
}) {
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
          text: 'Store Location',
          padding: const EdgeInsets.symmetric(horizontal: 66),
        ),
        // Some Space
        const CustomSizedBox(
          heightRatio: 0.004,
        ),
        AppBarSubtitleOne(
          text: currentLocation ?? 'Pakistan Lahore 45',
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
        ),
      ),
      // Some Space
      const CustomSizedBox(
        widthRatio: 0.04,
      ),
      AppBarLeadingIconButtonOne(
        onTap: () {
          NavigatorService.push(
            MaterialPageRoute(
              builder: (context) => const NotificationScreen(),
            ),
          );
        },
        child: CustomImageView(
          imagePath: Resources.imagePath.trolley,
        ),
      ),
    ],
  );
}
