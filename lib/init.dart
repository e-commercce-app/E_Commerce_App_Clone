import 'package:firebase_core/firebase_core.dart';

import 'Export/e_commerce_export.dart';
import 'firebase_options.dart';

Future<void> initDataLoad() async {
  WidgetsFlutterBinding.ensureInitialized();
  // connect of the Firebase .
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // hide this status Bar and SystemNavigationBar .
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Resources.colors.kWhite));
}
