import 'package:flutter/cupertino.dart';

import '../../Export/e_commerce_export.dart';
import '../Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../Widgets/AppBar/app_bar_subtitle_one.dart';
import '../Widgets/AppBar/custom_appbar.dart';

class CartNoItemFound extends StatefulWidget {
  const CartNoItemFound({super.key});

  @override
  State<CartNoItemFound> createState() => _CartNoItemFoundState();
}

class _CartNoItemFoundState extends State<CartNoItemFound> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Resources.colors.kWhite,
      appBar: homePageAppBar(context, size: size),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(
                Resources.imagePath.cartNotFound,
                height: size.height * 0.3,
                width: size.width * 0.6,
                fit: BoxFit.cover,
                renderCache: RenderCache.drawingCommands,
              ),
              const CustomSizedBox(
                heightRatio: 0.003,
              ),
              AutoSizeText(
                "Ohh... Your Cart is Empty".toUpperCase(),
                presetFontSizes: const [18, 15, 10, 5],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              AutoSizeText(
                "But it doesn't have to be",
                presetFontSizes: const [15, 10, 5],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400, color: Resources.colors.kGrey),
              ),
              const CustomSizedBox(
                heightRatio: 0.06,
              ),
              SizedBox(
                width: size.width * 0.5,
                child: CustomButton(
                  size: size,
                  buttonText: "Shop Now",
                  onPressed: () {
                    NavigatorService.pushNamed(RoutesName.homeScreen);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget homePageAppBar(BuildContext context,
    {Function()? onTap, Size? size}) {
  return CustomAppBar(
    size: size!,
    leading: AppBarLeadingIconButtonOne(
      onTap: onTap ?? () => NavigatorService.goBack(),
      child: Icon(
        CupertinoIcons.arrow_left,
        color: Resources.colors.kBlack,
      ),
    ),
    centerTitle: true,
    title: AppbarSubtitleOne(
      text: "Item Not Found",
      margin: const EdgeInsets.only(left: 40),
    ),
  );
}
