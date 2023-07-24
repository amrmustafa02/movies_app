import 'package:flutter/cupertino.dart';

// const begin = Offset(0.0, 1.0); bottom
// const begin = Offset(1.0, 0.0);  left
class PageRouteUtils {
  static Route createRoute(Widget page, double x, double y) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0); bottom
        // const begin = Offset(1.0, 0.0);  left
        var begin = Offset(x, y);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
