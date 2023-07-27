import 'package:flutter/material.dart';

import 'main_screen.dart';

class SearchBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFF243554).withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.topLeft,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchScreen());
          },
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchScreen());
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Text(
                "Search for a movie",
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.withOpacity(0.5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
