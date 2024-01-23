import '../../Export/e_commerce_export.dart';

final ThemeData eCommerceTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  // colorSchemeSeed: Resources.colors.allAppColor,
  primaryColor: Resources.colors.white,
  colorScheme: _getCustomColorScheme(),
  textTheme: _getTextTheme(),
  scaffoldBackgroundColor: Resources.colors.allAppColor,
);

TextTheme _getTextTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: Resources.colors.largeTextColor,
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
    ),
    // displayMedium: TextStyle(
    //   color: colorScheme.primaryContainer,
    //   fontSize: 40,
    //   fontFamily: 'Airbnb Cereal App',
    //   fontWeight: FontWeight.w500,
    // ),
    headlineSmall: GoogleFonts.poppins(
      color: Resources.colors.titleTextColor,
      fontSize: 18.0,
      height: 0.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

ColorScheme _getCustomColorScheme() {
  return ColorScheme.light(
    brightness: Brightness.light,
    primary: Resources.colors.white,
    onPrimary: Resources.colors.white,
    onError: Resources.colors.errorRedColor,
    background: Resources.colors.white,
  );
}
