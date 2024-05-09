import '../../Export/e_commerce_export.dart';

class AppTextStyle {
  // ! OnBoarding Screen .

// ** Text Style Nike Text .
  TextStyle nikeTextStyleText(size) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.height * 0.2,
        overflow: TextOverflow.ellipsis,
        color: Resources.colors.kLightGrey);
  }

  //  ** OnBoarding Bold Text 1
  TextStyle boldText1TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.05,
        fontWeight: FontWeight.w500,
        color: Resources.colors.kLargeTextColor);
  }

  //  ** OnBoarding Bold Text 2
  TextStyle boldText2TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.05,
        fontWeight: FontWeight.w500,
        color: Resources.colors.kLargeTextColor);
  }

  // ** OnBoarding Small Text 1
  TextStyle smallText1TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.025,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Resources.colors.kTitleTextColors);
  }

  //  ** OnBoarding Small Text 2
  TextStyle smallText2TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.025,
        letterSpacing: 1,
        fontWeight: FontWeight.w500,
        color: Resources.colors.kTitleTextColors);
  }

  //!  Custom Button File Text Style
  TextStyle customButtonTextStyle({size, textColor}) {
    return TextStyle(
        fontSize: size.height * 0.020,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500,
        color: textColor ?? Resources.colors.kWhite);
  }

  // ! SignUp Screen TextStyle .
  // ** create Account text style
  TextStyle createAccountTextStyle({size}) {
    return TextStyle(
      fontSize: size.height * 0.030,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w500,
    );
  }

  // ** create Account text style
  TextStyle togetherCreateTextStyle({size}) {
    return TextStyle(
      color: Resources.colors.kGray600,
      fontSize: size.height * 0.017,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w400,
    );
  }

  // ** create Account text style
  TextStyle userNameTextStyle({size}) {
    return TextStyle(
      fontSize: size.height * 0.018,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w500,
    );
  }

  // ! Drawer List Tile Text Style
  TextStyle drawerTextStyle() {
    return GoogleFonts.alegreya(
      color: Resources.colors.kWhite,
      fontSize: 18.0,
      height: 0.0,
      textStyle: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      fontWeight: FontWeight.w500,
    );
  }
}

// !  Product Name Text .
Widget productNameText({required String name, double? fontSize}) {
  return AutoSizeText(
    name,
    style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
      fontSize: fontSize ?? 25,
      color: Resources.colors.kBlack,
      fontWeight: FontWeight.bold,
    )),
    overflow: TextOverflow.ellipsis,
  );
}

// ! Product Price Text .
Widget productPriceText({required String price, double? fontSize}) {
  return AutoSizeText(price,
      style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
        fontSize: fontSize ?? 18,
        color: Resources.colors.kBlack,
        fontWeight: FontWeight.bold,
      )),
      overflow: TextOverflow.ellipsis);
}
