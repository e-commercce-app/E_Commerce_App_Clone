part of 'widget.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Create Account'.toUpperCase(),
          style: Resources.textStyle.createAccountTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.003),
        Text(
          "Let's Create Account Together",
          style: Resources.textStyle.togetherCreateTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
