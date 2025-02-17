import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/init.dart';

void main() async {
  // On Create initial Data Load .
  await initDataLoad();
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
      ),
    );
  }
}
