import 'package:flutter/material.dart';
import 'package:navigator_2_sample/book_detail_page.dart';
import 'package:navigator_2_sample/book_list_screen.dart';

import 'book.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BooksAppState();
}

class BooksAppState extends State<BooksApp> {
  Book? _selectedBook;
  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'book app',
      home: Navigator(
        pages: [
          BookListPage(books: books, onTapped: _handleOnTapped),
          if (_selectedBook != null) BookDetailPage(_selectedBook!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          setState(() {
            _selectedBook = null;
          });
          return true;
        },
      ),
    );
  }

  void _handleOnTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}
