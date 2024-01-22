import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Components/Resources/e_commerce_theme.dart';
import 'Export/e_commerce_export.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes_E_Commerce',
        theme: eCommerceTheme,
        initialRoute: RoutesName.onBoardingScreen,
        onGenerateRoute: RoutesMethod.onGenerateRoutes,
        // home: const OnBoardingScreen(),
      ),
    );
  }
}
