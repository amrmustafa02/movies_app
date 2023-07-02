import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/top_tabbar.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../controllers/viewModel/home_view_model.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "main-screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<TabItem> topTabbarTabItemlist() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: const Text("Nautics SideBar"),
        tab: const Center(
            child: Text("Nautics SideBar", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {
          print("");
        },
        title: const Text("Public Events"),
        tab: const Center(
            child: Text("Public Events", style: TextStyle(fontSize: 30))),
      ),
    ];
    return topTabbarTabItemlist;
  }

  Widget floatingTabBarPageView() {
    return FloatingTabBar(
     children: topTabbarTabItemlist(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Moviecco",
              style: TextStyle(
                  fontSize: 34, color: Colors.white, fontFamily: "Romanesco")),
        ),
        extendBody: true,
        body: floatingTabBarPageView());
  }

  getBottom() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            label: "Home",
            icon: const Icon(
              Icons.home_rounded,
            )),
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            label: "Explore",
            icon: const Icon(Icons.explore_rounded)),
        const BottomNavigationBarItem(
            label: "Likes", icon: Icon(Icons.favorite_rounded)),
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            label: "Profile",
            icon: const Icon(Icons.person_rounded)),
      ],
    );
  }
}
