part of 'widgets.dart';

// This widget builds the forgot password link.
class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        splashColor: Resources.colors.kBlue.withOpacity(0.5),
        onTap: () => NavigatorService.pushNamed(
          RoutesName.forgetPasswordScreen,
        ),
        child: AutoSizeText(recoveryPassword),
      ),
    );
  }
}
