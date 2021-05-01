import 'package:flutter/material.dart';
import 'package:navigator_2_sample/model/book.dart';
import 'package:navigator_2_sample/page/book_detail_page.dart';
import 'package:navigator_2_sample/page/book_list_page.dart';
import 'package:navigator_2_sample/navigator/book_route_path.dart';
import 'package:navigator_2_sample/page/unknown_page.dart';

class BookRouteDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  BookRouteDelegate() : this._navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _navigatorKey;

  Book? _selectedBook;
  bool _show404 = false;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  BookRoutePath get currentConfiguration {
    if (_show404) {
      return BookRoutePath.unknown();
    }

    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook!));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        BookListPage(books: books, onTapped: _handleOnTapped),
        if (_show404)
          UnknownPage()
        else if (_selectedBook != null)
          BookDetailPage(_selectedBook!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _selectedBook = null;
        _show404 = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      _show404 = true;
      return;
    }

    if (path.isDetailPage) {
      final id = path.id!;
      if (id < 0 || books.length - 1 < id) {
        _selectedBook = null;
        _show404 = true;
        return;
      }
      _selectedBook = books[path.id!];
    } else {
      _selectedBook = null;
    }

    _show404 = false;
  }

  void _handleOnTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}


class RD extends RouterDelegate {
  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

}