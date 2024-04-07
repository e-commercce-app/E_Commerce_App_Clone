// ignore_for_file: must_be_immutable

import '../../../Export/e_commerce_export.dart';

class AppbarSubtitleOne extends StatelessWidget {
  AppbarSubtitleOne({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(key: key);

  String text;
  EdgeInsetsGeometry? margin;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap!.call();
        },
        child: AutoSizeText(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            presetFontSizes: const [14, 11, 8, 5],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium));
  }
}
