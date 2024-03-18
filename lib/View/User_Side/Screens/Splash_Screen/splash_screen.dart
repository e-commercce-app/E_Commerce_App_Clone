import 'dart:async';

import 'package:e_commerce/Controller/Services/get_user_data_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Export/e_commerce_export.dart';
import 'Components/custom_text.dart';

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
    Timer(const Duration(milliseconds: 6), () {
      currentLoadScreen(context);
    });
    // Full Screen .
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> currentLoadScreen(BuildContext context) async {
    if (currentUserDefine != null) {
      var userData = await GetUserDataController.getUserData(
          userUid: currentUserDefine!.uid);
      if (userData[0]['isAdmin'] == true) {
        setStatusBarMode();
        NavigatorService.pushNamed(RoutesName.bottomBarScreen);
      } else {
        setStatusBarMode();
        NavigatorService.pushNamed(RoutesName.bottomBarScreen);
      }
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.pushReplacementNamed(context, RoutesName.onBoardingScreen);
    }
  }

  void setStatusBarMode() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  }
  // void currentScreenLoaded() {
  //   if (currentUserDefine != null) {
  //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.dark,
  //     ));
  //     SystemChrome.setEnabledSystemUIMode(
  //       SystemUiMode.edgeToEdge,
  //     );
  //     Navigator.pushReplacementNamed(context, RoutesName.bottomBarScreen);
  //   } else {
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //     Navigator.pushReplacementNamed(context, RoutesName.onBoardingScreen);
  //   }
  // }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => NavigatorService.goBack(),
        child: SafeArea(
          top: false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ! Image Section
              SizedBox(
                height: size.height,
                child: Image(
                  image: AssetImage(
                    Resources.imagePath.imgSplash,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // const CustomSizedBox(heightRatio: 0.01,),
              // ! Text Sections .
              const CustomTextKit(),
            ],
          ),
        ),
      ),
    );
  }
}
