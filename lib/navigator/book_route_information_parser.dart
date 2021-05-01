import 'package:flutter/material.dart';
import 'package:navigator_2_sample/navigator/book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    // handle /
    if (uri.pathSegments.length == 0) {
      return BookRoutePath.home();
    }

    // handle /book/:id
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
      final id = int.tryParse(uri.pathSegments[1]);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    // handle unknown path
    return BookRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    } else if (path.isHomePage) {
      return RouteInformation(location: '/');
    } else if (path.isDetailPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    throw Error();
  }
}
