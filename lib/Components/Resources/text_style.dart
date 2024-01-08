import 'package:e_commerce/Export/e_commerce_export.dart';

class AppTextStyle {
  // ! OnBoarding Screen .

// ** Text Style Nike Text .
  TextStyle nikeTextStyleText(size) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.height * 0.2,
        overflow: TextOverflow.ellipsis,
        color: Resources.colors.lightGrey);
  }

  //!  Custom Button File Text Style
  TextStyle customButtonTextStyle() {
    return const TextStyle(
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
    );
  }
}
