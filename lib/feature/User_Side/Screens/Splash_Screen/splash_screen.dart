// ignore_for_file: flutter_style_todos

import 'dart:async';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Splash_Screen/Components/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? currentUserDefine = FirebaseServices.auth.currentUser;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 6), currentLoadScreen);
    // Full Screen .
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> currentLoadScreen() async {
    if (currentUserDefine != null) {
      // * User is signed up/logged in, go to bottomBarScreen
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await NavigatorService.pushReplacementsNamed(
        RoutesName.bottomBarScreen,
      );
    } else {
      // * User is not signed up/logged in, go to onBoardingScreen
      setStatusBarMode();
      await NavigatorService.pushReplacementsNamed(
        RoutesName.onBoardingScreen,
      );
    }
  }

  //Todo =>  Three Different screen open to (currentLoadScreen)
  // Future<void> currentLoadScreen(BuildContext context) async {
  //   try {
  //     if (currentUserDefine != null) {
  //       final userData = await GetUserDataController.getUserData(
  //         userUid: currentUserDefine!.uid,
  //       );
  //       if (userData.isNotEmpty && userData[0]['isUser'] == true) {
  //         setStatusBarMode();
  //         await NavigatorService.pushReplacementsNamed(
  //           RoutesName.bottomBarScreen,
  //         );
  //       } else {
  //         setStatusBarMode();
  //         await NavigatorService.pushReplacementsNamed(
  //           RoutesName.bottomBarScreen,
  //         );
  //       }
  //     } else {
  //       await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //       await NavigatorService.pushReplacementsNamed(
  //         RoutesName.onBoardingScreen,
  //       );
  //     }
  //   } catch (e) {
  //     log('Error loading screen: $e');
  //     await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //     await NavigatorService.pushReplacementsNamed(
  //       RoutesName.onBoardingScreen,
  //     );
  //   }
  // }

  void setStatusBarMode() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: GestureDetector(
        onTap: NavigatorService.goBack,
        child: SafeArea(
          top: false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ! Image Section
              SizedBox(
                height: size.height,
                child: CustomImageView(
                  imagePath: Resources.imagePath.imgSplash,
                  fit: BoxFit.cover,
                ),
              ),
              // ! Text Sections .
              const CustomTextKit(),
            ],
          ),
        ),
      ),
    );
  }
}
