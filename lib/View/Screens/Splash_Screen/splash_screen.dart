import '../../../Export/e_commerce_export.dart';
import 'Components/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ! Image Section
          SizedBox(
            height: size.height,
            child: Image(
              image: AssetImage(
                Resources.imagePath.nikeBoots,
              ),
              fit: BoxFit.fill,
            ),
          ),
          // const CustomSizedBox(heightRatio: 0.01,),
          // ! Text Sections .
          const CustomTextKit(),
        ],
      ),
    );
  }
}
