part of 'widgets.dart';

// This widget builds the header section of the sign-in screen.
class Header extends StatelessWidget {
  const Header({required this.size, super.key});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(heightRatio: 0.08),
        Text(
          helloAgain.toUpperCase(),
          style: Resources.textStyle.createAccountTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.003),
        Text(
          welcomeBackYouMissed,
          style: Resources.textStyle.togetherCreateTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.07),
      ],
    );
  }
}
