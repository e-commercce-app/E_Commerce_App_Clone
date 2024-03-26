import 'package:e_commerce/View/Admin_Panel/Screens/admin_main_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Models/shoes_product_home_page.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Forget_Password/bloc/recovery_password_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Forget_Password/recovery_password.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Sign_in_Screen/bloc/sign_in_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Sign_in_Screen/sign_in_screen.dart';
import 'package:e_commerce/View/User_Side/Screens/Detail_Screen/detail_screen.dart';
import 'package:e_commerce/View/User_Side/Screens/My_Cart_Screen/bloc/cart_fetch_data_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/My_Cart_Screen/my_cart_main.dart';
import 'package:e_commerce/View/User_Side/Screens/Navigation_Bar_Screens/Cart/bloc/cart_bottom_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/Navigation_Bar_Screens/Profile_Page/profile_main_screen.dart';
import 'package:e_commerce/View/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/View/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_event.dart';
import 'package:e_commerce/View/User_Side/Screens/OnBoarding_Screen/onboarding_screen.dart';
import 'package:e_commerce/View/User_Side/Screens/Splash_Screen/splash_screen.dart';

import '../../Components/Error/route_not_found_page.dart';
import '../../Export/e_commerce_export.dart';
import '../../View/User_Side/Screens/Auth/Sign_Up_Screen/sign_up_screen.dart';
import '../../View/User_Side/Screens/Navigation_Bar_Screens/Home/home_screen.dart';
import '../../View/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/bloc/search_bloc.dart';
import '../../View/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/search_main_page.dart';
import '../../View/User_Side/Screens/Navigation_Bar_Screens/bloc/bottom_navigation_bloc.dart';
import '../../View/User_Side/Screens/Navigation_Bar_Screens/navigation_bar_main.dart';
import 'page_transition.dart';

// ! Routes Name
abstract class RoutesName {
  // Auth related Screens .
  static const String splashScreen = "SplashScreen";
  static const String onBoardingScreen = "OnBoardingScreen";
  static const String signUpScreen = "signUpScreen";
  static const String signInScreen = "signInScreen";
  static const String forgetPasswordScreen = "ForgetPasswordScreen";
  static const String password = "Password";

  // Todo =>  User Panel Screens
  static const String bottomBarScreen = "BottomBarScreen";
  static const String homeScreen = "HomeScreen";
  static const String searchHomeView = "SearchHomeView";
  static const String detailScreen = "DetailScreen";
  static const String addToCartScreen = "AddToCartScreen";
  static const String profile = "profile";

  // Todo =>  Admin Panel Screens
  static const String adminPanel = "AdminPanelScreen";
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
      return CustomPageTransition(
          //     child: MultiBlocProvider(providers: [
          //   BlocProvider(
          //     create: (context) => SearchBloc(),
          //     lazy: false,
          //   ),
          //   BlocProvider(create: (context) => Matrix4RotationBloc())
          // ],
          child: const HomeScreen()
          // )

          );
    }
    // 4
    else if (settings.name == RoutesName.searchHomeView) {
      return CustomPageTransition(
          child: BlocProvider(
              create: (context) => SearchBloc(),
              child: const SearchingTextField()));
    }
    // 5
    else if (settings.name == RoutesName.signUpScreen) {
      return CustomPageTransition(
        child: BlocProvider(
          create: (context) => SignUpBloc(),
          child: const SignUpScreen(),
        ),
      );
    }
    // 6
    else if (settings.name == RoutesName.signInScreen) {
      return CustomPageTransition(
          child: BlocProvider(
        create: (context) => SignInBloc(),
        child: const SignInScreen(),
      ));
    }
    // 7
    else if (settings.name == RoutesName.forgetPasswordScreen) {
      return CustomPageTransition(
          child: BlocProvider(
        create: (context) => RecoveryPasswordBloc(),
        child: const ForgetPassword(),
      ));
    }
    // 8
    else if (settings.name == RoutesName.bottomBarScreen) {
      return CustomPageTransition(
          child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavigationBloc(),
          ),
          BlocProvider(
            create: (context) => CartBottomBloc(),
          ),
        ],
        child: const BottomBarScreen(),
      ));
    }
    // 9
    else if (settings.name == RoutesName.detailScreen) {
      return CustomPageTransition(
          child: DetailsScreen(
        productHomeScreen: settings.arguments as ProductShoesHomePage,
      ));
    }
    // 10
    else if (settings.name == RoutesName.addToCartScreen) {
      return CustomPageTransition(
          child: BlocProvider(
        create: (context) => CartFetchDataBloc(),
        child: const AddToCartScreen(),
      ));
    }
    // 11
    else if (settings.name == RoutesName.profile) {
      return CustomPageTransition(child: const ProfileScreen());
    }
    // 12
    else if (settings.name == RoutesName.adminPanel) {
      return CustomPageTransition(child: const AdminScreen());
    }
    // NOT FOUND
    else {
      return MaterialPageRoute(
        builder: (context) => NotFound404Error(
          imagePath: Resources.imagePath.notFound,
        ),
      );
    }
  }
}
