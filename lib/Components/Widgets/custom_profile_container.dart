import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer(
      {super.key,
      required this.title,
      required this.screenHeight,
      required this.screenWidth});
  final String title;
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: screenHeight * 0.07,
        width: screenWidth * 0.9,
        padding:
            EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Resources.colors.kWhite,
        ),
        child: AutoSizeText(
          title,
          presetFontSizes: const [25, 20, 15, 10],
          style: GoogleFonts.abhayaLibre(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(overflow: TextOverflow.ellipsis),
              fontSize: 25,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
