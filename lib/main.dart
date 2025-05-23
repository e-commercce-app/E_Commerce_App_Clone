import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
}

void main() async {
  //! On Create initial Data Load .
  await initDataLoad();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  // Set this PreferredOrientations .
  await Future.wait([
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    ),
  ]).then((value) {
    runApp(const ECommerce());
  });
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageViewBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        title: shoesECommerce,
        theme: eCommerceTheme,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: RoutesMethod.onGenerateRoutes,
        // home: const CategoriesTab(),
      ),
    );
  }
}
