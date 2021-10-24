import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/ui/detail_screen.dart';
import 'package:restaurant_app/ui/base_page.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/splashscreen_view.dart';

import 'data/api/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "restaurant app ",
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      initialRoute: "/splashscreen",
      routes: {
        "/splashscreen": (context) => SplashscreenView(),
        "/base_page": (context) => BasePage(),
        "/detail_screen": (context) => DetailScreen(
              restoId: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
