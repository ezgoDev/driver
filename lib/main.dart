import 'package:driver/route/app_route_information_parser.dart';
import 'package:driver/route/app_router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    print('_BiliAppState:build');
    //定义route
    var widget = Router(
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate: AppRouterDelegate(),
      ///routeInformationParser为null时可缺省，routeInformation提供者
      routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: const RouteInformation(location: '/')),
    );
    return MaterialApp(home: widget);
  }
}

