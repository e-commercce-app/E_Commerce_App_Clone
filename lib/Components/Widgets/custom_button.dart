import '../../Export/e_commerce_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.buttonText});
  final Size size;
  final VoidCallback onPressed;
  final bool buttonText;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Resources.colors.buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textColor: Resources.colors.white,
      elevation: 0,
      height: size.height * 0.06,
      splashColor: Colors.transparent,
      focusElevation: 8,
      child: Center(
        child: buttonText
            ? const Text("Next Page")
            : Text("GetStarted",
                style: Resources.textStyle.customButtonTextStyle()),
      ),
    );
  }
}
