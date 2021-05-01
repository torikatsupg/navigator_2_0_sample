import 'package:flutter/material.dart';
import 'package:navigator_2_sample/model/book.dart';

class BookListPage extends Page {
  const BookListPage(
      {required this.books, required this.onTapped, LocalKey? key})
      : super(key: key);
  final List<Book> books;
  final ValueChanged<Book> onTapped;

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
          child: BookListScreen(books, onTapped),
          key: ValueKey('BookListPage'),
        );
      },
    );
  }
}

class BookListScreen extends StatelessWidget {
  const BookListScreen(
    this._books,
    this._onTapped, {
    Key? key,
  }) : super(key: key);
  final List<Book> _books;
  final ValueChanged<Book> _onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('book list'),
      ),
      body: ListView(
        children: _buildBookTiles(),
      ),
    );
  }

  List<ListTile> _buildBookTiles() {
    return _books
        .map(
          (e) => ListTile(
              title: Text(e.title),
              subtitle: Text(e.author),
              onTap: () => _onTapped(e)),
        )
        .toList();
  }
}
