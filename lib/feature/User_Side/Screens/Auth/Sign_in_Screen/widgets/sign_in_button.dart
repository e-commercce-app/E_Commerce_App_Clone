part of 'widgets.dart';
// This widget builds the sign-in button.
class SignInButton extends StatelessWidget {
  const SignInButton({required this.size, super.key});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(heightRatio: 0.05),
        CustomButton(
          size: size,
          onPressed: () {
            BlocProvider.of<SignInBloc>(context).add(SignInClickEvent());
          },
          buttonText: signIn,
        ),
        const CustomSizedBox(heightRatio: 0.05),
      ],
    );
  }
}
