import 'package:flutter/material.dart';
import 'package:google_translate_clone/screens/home_page/views/home_page.dart';

class AppRoutes {
  static String homePage = "/";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
  };
}
