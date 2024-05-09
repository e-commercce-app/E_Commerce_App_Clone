import 'package:e_commerce/Export/e_commerce_export.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // ! pushNamed
  static Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  // ! goBack
  static void goBack() async {
    return navigatorKey.currentState?.pop();
  }

  // ! push
  static Future<dynamic> push(Route<dynamic> route) async {
    return navigatorKey.currentState?.push(
      route,
    );
  }

  // ! pushReplacementNamed
  static Future<dynamic> pushReplacementsNamed(String route) {
    return navigatorKey.currentState!.pushReplacementNamed(
      route,
    );
  }

  //! pushNamedAndRemoveUntil
  static Future<dynamic> pushNamedAndRemoveUntil(String newRouteName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRouteName, (route) => false);
  }
}
