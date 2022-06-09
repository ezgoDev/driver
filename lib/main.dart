import 'package:driver/model/order.dart';
import 'package:driver/pages/home_page.dart';
import 'package:driver/pages/order_detail_page.dart';
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
  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    print('_BiliAppState:build');
    //定义route
    var widget = Router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,

      ///routeInformationParser为null时可缺省，routeInformation提供者
      routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: const RouteInformation(location: '/')),
    );
    return MaterialApp(home: widget);
  }
}

///可缺省，主要应用与web，持有RouteInformationProvider 提供的 RouteInformation ，可以将其解析为我们定义的数据类型。
class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    print('BiliRouteInformationParser:parseRouteInformation:uri:$uri');
    if (uri.pathSegments.length == 0) {
      return RoutePath.home();
    }
    return RoutePath.orderDetail();
  }
}

class RoutePath {
  final String location;

  RoutePath.home(): location = '/';

  RoutePath.orderDetail(): location = '/orderDetail';
}

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  late RoutePath path;
  List<MaterialPage> pages = [];
  OrderModel? orderModel;

  //为Navigator设置一个key，必要的时候可以通过navigatorKey.currentState来获取到NavigatorState对象
  AppRouterDelegate(): navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //构建路由栈
    pages = [
      pageWrap(HomePage(
        onJumpOrderDetail: (mo) {
          orderModel = mo;
          notifyListeners();
        },
      )),
      if (orderModel != null)
        pageWrap(
          OrderDetailPage(orderModel: orderModel!)
        )
    ];
    print('BiliRouterDelegate:build');
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        print('Navigator:onPopPage');
        //在这里可以控制是否可以返回
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }

  //路由初始化时，Router 会调用setNewRoutePath 方法来更新应用程序的路由状态：
  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    print('BiliRouterDelegate:setNewRoutePath:$path');
    this.path = path;
  }
}

///创建Page
pageWrap(Widget child) {
  return MaterialPage(
    key: ValueKey(child.hashCode),
    child: child,
  );
}
