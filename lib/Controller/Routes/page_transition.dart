//! Controll Page Transition
import '../../Export/e_commerce_export.dart';

class CustomPageTransition extends PageRouteBuilder {
  Widget child;
  CustomPageTransition({required this.child})
      : super(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(microseconds: 700),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => child);
}
