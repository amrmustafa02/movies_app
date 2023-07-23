import 'package:flutter/material.dart';

typedef onClickFunction = void Function();
class ShowMoreDetailsItem extends StatelessWidget {
  String iconPath;
  String iconText;
  onClickFunction onClick;
  ShowMoreDetailsItem({required this.onClick,required this.iconPath,required this.iconText});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
            const Spacer(),
             Text(
              "$iconText ",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).primaryColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}

