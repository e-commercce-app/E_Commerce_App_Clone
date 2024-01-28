import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_bloc.dart';
import 'package:e_commerce/View/Screens/Home/home_screen.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_event.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/onboarding_screen.dart';
import 'package:e_commerce/View/Screens/Splash_Screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Export/e_commerce_export.dart';
import '../../View/Screens/Auth/Sign_Up_Screen/sign_up_screen.dart';

// ! Routes Name
abstract class RoutesName {
  // Auth related Screens .
  static const String splashScreen = "SplashScreen";
  static const String onBoardingScreen = "OnBoardingScreen";
  static const String signUpScreen = "signUpScreen";
  static const String signInScreen = "signInScreen";
  // Screens
  static const String homeScreen = "HomeScreen";
}

//  ! All Pages Controll  (onGenerateRoutes)
class RoutesMethod {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    // 1
    if (settings.name == RoutesName.splashScreen) {
      return CustomPageTransition(child: const SplashScreen());
    }
    // 2
    else if (settings.name == RoutesName.onBoardingScreen) {
      return CustomPageTransition(
          child: BlocProvider(
        create: (context) => PageViewBloc()..add(PageViewEvent()),
        child: const OnBoardingScreen(),
      ));
    }
    // 3
    else if (settings.name == RoutesName.homeScreen) {
      return CustomPageTransition(child: const HomeScreen());
    }
    // 4
    else if (settings.name == RoutesName.signUpScreen) {
      return CustomPageTransition(
          child: BlocProvider(
        create: (context) => SignUpBloc(SignUpState()),
        child: const SignUpScreen(),
      ));
    }
    // NOT FOUND
    else {
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("Page Not Found", overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }
  }
}

//! Controll Page Transition
class CustomPageTransition extends PageRouteBuilder {
  Widget child;
  CustomPageTransition({required this.child})
      : super(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(),
            reverseTransitionDuration: const Duration(),
            pageBuilder: (context, animation, secondaryAnimation) => child);
}
