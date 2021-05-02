import 'package:flutter/material.dart';
import 'package:navigator_2_sample/example/navigator/book_route_delegate.dart';
import 'package:navigator_2_sample/example/navigator/book_route_information_parser.dart';

void main() {
  runApp(NestedRouterDemo());
}

class NestedRouterDemo extends StatefulWidget {
  @override
  _NestedRouterDemoState createState() => _NestedRouterDemoState();
}

class _NestedRouterDemoState extends State<NestedRouterDemo> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
