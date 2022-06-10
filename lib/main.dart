import 'package:driver/pages/home_page.dart';
import 'package:driver/routes/app_route_information_parser.dart';
import 'package:driver/routes/app_router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App title',
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

