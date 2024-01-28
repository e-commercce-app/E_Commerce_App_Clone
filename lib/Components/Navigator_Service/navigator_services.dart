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
}
