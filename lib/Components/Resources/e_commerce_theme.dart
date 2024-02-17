import '../../Export/e_commerce_export.dart';

final ThemeData eCommerceTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  // colorSchemeSeed: Resources.colors.allAppColor,
  primaryColor: Resources.colors.white,
  colorScheme: _getCustomColorScheme(),
  textTheme: _getTextTheme(),
  scaffoldBackgroundColor: Resources.colors.allAppColor,
  dividerTheme: DividerThemeData(
    thickness: 1,
    space: 1,
    color: Resources.colors.blueGray50,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // backgroundColor: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
      visualDensity: const VisualDensity(
        vertical: -4,
        horizontal: -4,
      ),
      padding: EdgeInsets.zero,
    ),
  ),
);

TextTheme _getTextTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: Resources.colors.largeTextColor,
      fontSize: 40.0,
      textStyle: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: const TextStyle(
      fontSize: 12.0,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Resources.colors.titleTextColors,
      fontSize: 18.0,
      height: 0.0,
      textStyle: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      fontWeight: FontWeight.w500,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontFamily: 'Airbnb Cereal App',
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: TextStyle(
      color: Resources.colors.black,
      fontSize: 14,
      fontFamily: 'Airbnb Cereal App',
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
    ),
  );
}

ColorScheme _getCustomColorScheme() {
  return ColorScheme.light(
    brightness: Brightness.light,
    primary: Resources.colors.white,
    onPrimary: Resources.colors.white,
    onError: Resources.colors.errorRedColors,
    background: Resources.colors.white,
  );
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: const TextStyle(
          // color: appTheme.gray600,
          fontSize: 16,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 14,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 40,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 28,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 24,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 12,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 20,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 16,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 14,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w500,
        ),
      );
}
