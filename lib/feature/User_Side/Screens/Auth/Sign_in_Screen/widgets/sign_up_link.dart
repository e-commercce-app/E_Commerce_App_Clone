part of 'widgets.dart';

// This widget builds the sign-up link.
class SignUpLink extends StatelessWidget {
  const SignUpLink({required this.size, super.key});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          haveAnOtherAccount,
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
              RoutesName.signUpScreen,
            ),
            child: Text(
              'Sign Up',
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
