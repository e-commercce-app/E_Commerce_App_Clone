// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';

import '../../../Export/e_commerce_export.dart';

class AppbarSubtitleTwo extends StatelessWidget {
  AppbarSubtitleTwo({
    Key? key,
    required this.text,
    this.padding,
    this.onTap,
  }) : super(key: key);

  String text;
  EdgeInsetsGeometry? padding;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        child: AutoSizeText(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          presetFontSizes: const [
            12,
            9,
            6,
          ],
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Resources.colors.gray600),
        ),
      ),
    );
  }
}
