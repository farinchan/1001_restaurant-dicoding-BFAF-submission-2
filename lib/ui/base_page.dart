import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/ui/bookmark_page.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/search_page.dart';
import 'package:restaurant_app/ui/settings_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int indexBottomNav = 0;
  List<Widget> widgetOptions = [
    ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: HomePage(),
    ),
    ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (_) => SearchRestaurantProvider(apiService: ApiService()),
      child: SearchPage(),
    ),
    BookmarkPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(indexBottomNav),
      bottomNavigationBar: SalomonBottomBar(
          onTap: (index) {
            setState(() {
              indexBottomNav = index;
            });
          },
          currentIndex: indexBottomNav,
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: HomeColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                selectedColor: SearchColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.bookmark),
                title: Text("Bookmark"),
                selectedColor: BookmarkColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setting"),
                selectedColor: settingColor),
          ]),
    );
  }
}
