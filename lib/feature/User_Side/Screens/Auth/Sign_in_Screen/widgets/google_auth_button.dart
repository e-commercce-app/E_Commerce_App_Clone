part of 'widgets.dart';

// This widget builds the Google authentication button.
class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    required this.size,
    required this.state,
    super.key,
  });
  final Size size;
  final SignInClickState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          background: Resources.colors.kWhite,
          textColor: Resources.colors.kBlack,
          size: size,
          onPressed: () {
            BlocProvider.of<SignInBloc>(context).add(SignInGoogleEvent());
          },
          buttonText: signInWithGoogle,
        ),
        const CustomSizedBox(heightRatio: 0.04),
      ],
    );
  }
}
