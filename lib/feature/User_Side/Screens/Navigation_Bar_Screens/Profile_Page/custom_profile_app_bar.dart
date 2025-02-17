// ! Profile Custom AppBar Section
import '../../../../../Export/e_commerce_export.dart';

PreferredSizeWidget profileCustomAppBar({required Size size}) {
  return CustomAppBar(
    size: size,
    centerTitle: true,
    title: AppBarSubtitleOne(text: profile.toUpperCase()),
  );
}
