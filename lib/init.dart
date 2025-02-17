import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initDataLoad() async {
  WidgetsFlutterBinding.ensureInitialized();
  // connect of the Firebase .
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // hide this status Bar and SystemNavigationBar .
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Resources.colors.kWhite,
    ),
  );
}
