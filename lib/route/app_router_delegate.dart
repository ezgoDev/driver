import 'package:driver/route/route_path.dart';
import 'package:flutter/material.dart';
import '../model/order_model.dart';
import '../pages/home_page.dart';
import '../pages/order_detail_page.dart';

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
