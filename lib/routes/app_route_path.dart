import 'package:driver/pages/home_page.dart';
import 'package:driver/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutePath {
 /// 定义路由列表
 static final Map<String, Page<dynamic> Function(BuildContext context)> _pathMapRoute = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
 };
 static AppRoutePath? currentAppRoutePath;
 static void setCurrentAppRoutePath(AppRoutePath newAppRoutePath) {
  AppRoutePath.currentAppRoutePath = newAppRoutePath;
 }


 final int? id;
 final bool isUnknown;

  AppRoutePath.home()
      : id = null,
        isUnknown = false;

  AppRoutePath.details(this.id, ) : isUnknown = false;

  AppRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}
