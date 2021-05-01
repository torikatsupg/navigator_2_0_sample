import 'package:flutter/material.dart';

class UnknownPage extends Page {
  const UnknownPage({LocalKey? key}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final tween = Tween(begin: Offset(0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: UnknownScreen(
            key: ValueKey('UnknownPage'),
          ),
        );
      },
    );
  }
}

class UnknownScreen extends StatelessWidget {
  UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404'),
      ),
    );
  }
}
