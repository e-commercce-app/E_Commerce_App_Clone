import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';

import 'Export/e_commerce_export.dart';
import 'init.dart';

void main() async {
  // On Create initial Data Load .
  await initDataLoad();
  // Set this PreferredOrientations .
  Future.wait([
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        title: 'Shoes_E_Commerce',
        theme: eCommerceTheme,
        initialRoute: RoutesName.bottomBarScreen,
        onGenerateRoute: RoutesMethod.onGenerateRoutes,
      ),
    );
  }
}
