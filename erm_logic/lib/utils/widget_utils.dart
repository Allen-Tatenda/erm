import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WidgetUtils {
  static Widget verticalSpace({double size = 8}) {
    return SizedBox(
      height: size,
    );
  }

  static Widget horizontalSpace({double size = 8}) {
    return SizedBox(
      width: size,
    );
  }

  static Route route(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  

  static PageTransition routeTransition(Widget screen) {
    return PageTransition(
      child: screen,
      type: PageTransitionType.fade,
      duration: const Duration(),
    );
  }
}
