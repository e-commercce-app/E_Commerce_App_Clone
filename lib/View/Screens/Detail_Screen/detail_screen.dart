// ignore_for_file: must_be_immutable

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../Components/Widgets/AppBar/app_bar_subtitle_two.dart';
import '../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../Export/e_commerce_export.dart';
import '../../../Models/shoes_product_home_page.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.productHomeScreen});
  ProductShoesHomePage productHomeScreen = ProductShoesHomePage();
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // screen size
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: homePageAppBar(context, size: size),
    );
  }
}

PreferredSizeWidget homePageAppBar(BuildContext context, {Size? size}) {
  return CustomAppBar(
    size: size!,
    leading: AppBarLeadingIconButtonOne(
      child: Icon(
        CupertinoIcons.arrow_left,
        color: Resources.colors.black,
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
            color: Resources.colors.gray600,
          )),
      // Some Space
      const CustomSizedBox(
        widthRatio: 0.04,
      ),
    ],
  );
}
