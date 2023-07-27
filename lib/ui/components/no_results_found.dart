import 'package:flutter/material.dart';

class NoResultsFoundItem extends StatelessWidget {
  String message;

  NoResultsFoundItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/no-review.png",
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.45),
        Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        )
      ],
    );
  }
}
