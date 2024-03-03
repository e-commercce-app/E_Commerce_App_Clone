// ! Profile Custom AppBar Section
import '../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../Export/e_commerce_export.dart';

PreferredSizeWidget profileCustomAppBar(
    {required Function()? onTap, required Size size}) {
  return CustomAppBar(
    size: size,
    centerTitle: true,
    title: AppbarSubtitleOne(text: "Profile".toUpperCase()),
    actions: [
      AppBarLeadingIconButtonOne(
          child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap ?? () {},
        child: Icon(Icons.edit_note_rounded,
            size: 30, color: Resources.colors.kButtonColor),
      )),
      // Some Space .
      const CustomSizedBox(
        widthRatio: 0.02,
      ),
    ],
  );
}
