class BookRoutePath {
  BookRoutePath(this.id, this.isUnknown);

  BookRoutePath.home()
      : this.id = null,
        this.isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown()
      : this.id = null,
        this.isUnknown = true;

  final int? id;
  final bool isUnknown;

  bool get isHomePage => id == null;

  bool get isDetailPage => id != null;
}
