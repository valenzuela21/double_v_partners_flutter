import 'package:double_partners/presentation/pages/create.page.dart';
import 'package:double_partners/presentation/pages/detail.page.dart';
import 'package:double_partners/presentation/pages/home.page.dart';
import 'package:flutter/material.dart';

abstract class Routes{
  static String home = "/home";
  static String detail = "/detail";
  static String create = "/create";
}


abstract class AppRoute {
  static String initial = Routes.home;
  static Map<String, Widget Function(BuildContext)> routes =  {
    Routes.home: (context) => const HomePage(),
    Routes.detail: (context) => DetailPage(),
    Routes.create: (context) => CreatePage(),
  };
}