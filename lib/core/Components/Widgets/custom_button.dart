import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.size,
    required this.onPressed,
    required this.buttonText,
    this.background,
    this.textColor,
    super.key,
  });
  final Size size;
  final VoidCallback onPressed;
  final String buttonText;
  final Color? background;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: background ?? Resources.colors.kButtonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(54)),
      textColor: Resources.colors.kWhite,
      elevation: 1,
      height: size.height * 0.06,
      splashColor: Colors.transparent,
      focusElevation: 8,
      child: Center(
        child: Text(
          buttonText,
          style: Resources.textStyle.customButtonTextStyle(
            size: size,
            textColor: textColor ?? Resources.colors.kWhite,
          ),
        ),
      ),
    );
  }
}
