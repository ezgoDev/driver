import 'package:driver/route/route_path.dart';
import 'package:flutter/cupertino.dart';

///可缺省，主要应用与web，持有RouteInformationProvider 提供的 RouteInformation ，可以将其解析为我们定义的数据类型。
class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    print('BiliRouteInformationParser:parseRouteInformation:uri:$uri');
    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    }
    return RoutePath.orderDetail();
  }
}
