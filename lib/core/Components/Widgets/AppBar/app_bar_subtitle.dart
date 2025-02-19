// ignore_for_file: must_be_immutable

import 'package:e_commerce/Export/e_commerce_export.dart';

class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    required this.text,
    this.margin,
    this.onTap,
    super.key,
  });

  String text;
  EdgeInsetsGeometry? margin;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: AutoSizeText(
          presetFontSizes: const [14, 11, 8],
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
          // ),
        ),
      ),
    );
  }
}
