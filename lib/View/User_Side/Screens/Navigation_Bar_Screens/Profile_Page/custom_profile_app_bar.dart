// ! Profile Custom AppBar Section
import '../../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget profileCustomAppBar({required Size size}) {
  return CustomAppBar(
    size: size,
    centerTitle: true,
    title: AppbarSubtitleOne(text: "Profile".toUpperCase()),
  );
}
