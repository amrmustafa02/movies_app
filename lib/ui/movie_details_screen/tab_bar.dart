import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: TabBar(
            splashFactory: NoSplash.splashFactory,
            enableFeedback: false,
            padding: EdgeInsets.all(5),
            indicator: BoxDecoration(
                boxShadow: [],
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor),
            tabs: [
              Text("Details"),
              Text("Reviews"),
              Text("More"),
            ]),
      ),
    );
  }
}
