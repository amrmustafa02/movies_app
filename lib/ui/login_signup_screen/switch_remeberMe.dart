import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/main/my_theme.dart';

class SwitchRememberMe extends StatefulWidget {
  @override
  State<SwitchRememberMe> createState() => _SwitchRememberMeState();
}

class _SwitchRememberMeState extends State<SwitchRememberMe> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              // overrides the default green color of the track
              activeColor: Colors.white,
              // color of the round icon, which moves from right to left
              thumbColor: Theme.of(context).primaryColor,
              // when the switch is off
              trackColor: MyTheme.secondColor.withOpacity(0.5),
              // boolean variable value
              value: isSelected,
              // changes the state of the switch
              onChanged: (_) {
                isSelected = !isSelected;
                setState(() {});
              },
            ),
          ),
          Text(
            "Remember me",
            style:
                TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}
