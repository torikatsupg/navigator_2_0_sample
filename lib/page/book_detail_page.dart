import 'package:flutter/material.dart';
import 'package:navigator_2_sample/model/book.dart';

class BookDetailPage extends Page {
  const BookDetailPage(this.book, {LocalKey? key}) : super(key: key);
  final Book book;

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
          child: BookDetailsScreen(
            key: ValueKey(book),
            book: book,
          ),
        );
      },
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({required this.book, Key? key}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
