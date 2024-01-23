import 'package:flutter/services.dart';

import '../../../Export/e_commerce_export.dart';
import 'Components/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Full Screen .
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
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
    );
  }
}
