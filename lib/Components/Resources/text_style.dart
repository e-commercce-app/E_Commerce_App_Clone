import '../../Export/e_commerce_export.dart';

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

  //  ** OnBoarding Bold Text 1
  TextStyle boldText1TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.05,
        fontWeight: FontWeight.w500,
        color: Resources.colors.largeTextColor);
  }

  //  ** OnBoarding Bold Text 2
  TextStyle boldText2TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.05,
        fontWeight: FontWeight.w500,
        color: Resources.colors.largeTextColor);
  }

  // ** OnBoarding Small Text 1
  TextStyle smallText1TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.025,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Resources.colors.titleTextColor);
  }

  //  ** OnBoarding Small Text 2
  TextStyle smallText2TextStyle(size) {
    return TextStyle(
        fontSize: size.height * 0.025,
        letterSpacing: 1,
        fontWeight: FontWeight.w500,
        color: Resources.colors.titleTextColor);
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

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: Colors.grey.shade600,
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
