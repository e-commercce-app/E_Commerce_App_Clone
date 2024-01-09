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
          Text(
            boldText1,
            style: Resources.textStyle.boldText1TextStyle(size),
          ),
          Text(
            boldText2,
            style: Resources.textStyle.boldText2TextStyle(size),
          ),
          // ! Small Text
          Text(
            smallText1,
            style: Resources.textStyle.smallText1TextStyle(size),
          ),
          Text(
            smallText2,
            style: Resources.textStyle.smallText2TextStyle(size),
          ),
        ],
      ),
    );
  }
}
