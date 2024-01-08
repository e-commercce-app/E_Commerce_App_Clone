import 'package:e_commerce/View/Screens/OnBoarding_Screen/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'Components/Resources/e_commerce_theme.dart';
import 'Export/e_commerce_export.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  // hide this status Bar and SystemNavigationBar .
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Resources.colors.white));
  // set this PreferredOrientations .
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((value) async {
    // connect of the Firebase .
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes_E_Commerce',
      theme: eCommerceTheme,
      home: const OnBoardingScreen(),
    );
  }
}
