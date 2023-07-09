import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailsTabView extends StatelessWidget {
  String overView;

  DetailsTabView({required this.overView});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Overview",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 5,
          ),
          ReadMoreText(
            overView,
            postDataTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
            preDataTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
            trimLines: 3,
            colorClickableText: Colors.red,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'More',
            trimExpandedText: 'Less',
            moreStyle:  TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            style: const TextStyle(fontSize: 16,color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
