import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  List<Tab> tabs;
  List<Widget> screensOfTabs;

  DiscoverScreen({required this.tabs, required this.screensOfTabs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            indicatorWeight: 1,
            padding: const EdgeInsets.all(8),
            tabs: tabs,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: TabBarView(children: screensOfTabs))
        ],
      ),
    );
  }
}
