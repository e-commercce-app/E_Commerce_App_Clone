import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';

import '../../../Export/e_commerce_export.dart';
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
    currentScreenLoaded();
    // Full Screen .
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void currentScreenLoaded() {
    if (currentUserDefine != null) {
      timer = Timer.periodic(const Duration(seconds: 6), (timer) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ));
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
        );

        Navigator.pushReplacementNamed(context, RoutesName.bottomBarScreen);
      });
    } else {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        Navigator.pushReplacementNamed(context, RoutesName.onBoardingScreen);
      });
    }
  }

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
