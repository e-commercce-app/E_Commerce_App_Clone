part of 'navigator.dart';

//  ! All Pages Control  (onGenerateRoutes)
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
        ),
      );
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
        child: const HomeScreen(),
        // )
      );
    }
    // 4
    else if (settings.name == RoutesName.searchHomeView) {
      return CustomPageTransition(
        child: BlocProvider(
          create: (context) => SearchBloc(),
          child: const SearchingTextField(),
        ),
      );
    }
    // 5
    else if (settings.name == RoutesName.signUpScreen) {
      return CustomPageTransition(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignUpBloc(),
            ),
            BlocProvider(
              create: (context) => CheckPasswordFieldBloc(),
            ),
          ],
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
        ),
      );
    }
    // 7
    else if (settings.name == RoutesName.forgetPasswordScreen) {
      return CustomPageTransition(
        child: BlocProvider(
          create: (context) => RecoveryPasswordBloc(),
          child: const ForgetPassword(),
        ),
      );
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
        ),
      );
    }
    // 9
    else if (settings.name == RoutesName.detailScreen) {
      return CustomPageTransition(
        child: DetailsScreen(
          productHomeScreen: settings.arguments! as ProductShoesHomePageModel,
        ),
      );
    }
    // 10
    else if (settings.name == RoutesName.addToCartScreen) {
      return CustomPageTransition(
        child: BlocProvider(
          create: (context) => CartFetchDataBloc(),
          child: const AddToCartScreen(),
        ),
      );
    }
    // 11
    else if (settings.name == RoutesName.profile) {
      return CustomPageTransition(child: const ProfileScreen());
    }
    // 12
    else if (settings.name == RoutesName.checkOutScreen) {
      return CustomPageTransition(child: const CheckOutScreen());
    }
    // 13
    else if (settings.name == RoutesName.orderNowScreen) {
      return CustomPageTransition(child: const OrderNowScreen());
    }
    // 14
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
