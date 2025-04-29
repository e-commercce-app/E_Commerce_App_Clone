part of 'widget.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          'Already have an account?',
          style: TextStyle(
            fontSize: size.height * 0.015,
            fontFamily: 'Airbnb Cereal App',
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: InkWell(
            onTap: () => NavigatorService.pushReplacementsNamed(
              RoutesName.signInScreen,
            ),
            child: AutoSizeText(
              'Sign In',
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontFamily: 'Airbnb Cereal App',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
