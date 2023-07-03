import 'package:flutter/material.dart';

import 'glass_item.dart';

class IconPlayVideo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        child: GlassItem(
          theChild: Icon(
            Icons.play_arrow,
            color: Theme.of(context).primaryColor,
          ),
          theHeight: 50.0,
          theWidth: 50.0,
        ),
      ),
    );
 
  }

}