import 'package:flutter/material.dart';
import 'package:navigator_2_sample/navigator/book_route_delegate.dart';
import 'package:navigator_2_sample/navigator/book_route_information_parser.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BooksAppState();
}

class BooksAppState extends State<BooksApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'book app',
      routerDelegate: BookRouteDelegate(),
      routeInformationParser: BookRouteInformationParser(),
    );
  }
}
