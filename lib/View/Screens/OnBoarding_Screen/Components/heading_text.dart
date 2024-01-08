import '../../../../Export/e_commerce_export.dart';

class HeadingsOnboardingScreen extends StatelessWidget {
  const HeadingsOnboardingScreen({
    super.key,
    required this.size,
    required this.boldText1,
    required this.boldText2,
    required this.smallText1,
    required this.smallText2,
  });

  final Size size;
  final String boldText1;
  final String boldText2;
  final String smallText1;
  final String smallText2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // !Large Text
          Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: boldText1,
                style: TextStyle(
                    fontSize: size.height * 0.05,
                    fontWeight: FontWeight.w500,
                    color: Resources.colors.largeTextColor),
              )),
          Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: boldText2,
                style: TextStyle(
                    fontSize: size.height * 0.05,
                    fontWeight: FontWeight.w500,
                    color: Resources.colors.largeTextColor),
              )),
          // ! Small Text
          Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: smallText1,
                style: TextStyle(
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: Resources.colors.titleTextColors),
              )),
          Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: smallText2,
                style: TextStyle(
                    fontSize: size.height * 0.025,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Resources.colors.titleTextColors),
              )),
        ],
      ),
    );
  }
}
