import '../../Export/e_commerce_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.buttonText,
      this.background,
      this.textColor});
  final Size size;
  final VoidCallback onPressed;
  final String buttonText;
  final Color? background;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: background ?? Resources.colors.buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(54)),
      textColor: Resources.colors.white,
      elevation: 0,
      height: size.height * 0.06,
      splashColor: Colors.transparent,
      focusElevation: 8,
      child: Center(
        child: Text(buttonText,
            style: Resources.textStyle
                .customButtonTextStyle(size: size, textColor: textColor)),
      ),
    );
  }
}
