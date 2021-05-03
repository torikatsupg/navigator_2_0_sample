class Path {
  const Path(this.global, [this.navigation, this.local, this.detail]);

  final GlobalPath global;
  final NavigationPath? navigation;
  final LocalPath? local;
  final DetailPath? detail;

  String get uri {
    final sb = StringBuffer('/${global.value}');
    if (navigation == null) return sb.toString();
    sb.write('/${navigation!.value}');

    if (local == null) return sb.toString();
    sb.write('/${local!.value}');

    if (detail == null) return sb.toString();
    sb.write('/${detail!.value}');

    sb.toString();
  }
}

class AppPath {
  const AppPath();
  String get uri => '/';
}

class GlobalPath extends AppPath {
  const GlobalPath(this.global) : super();

  final GlobalPathType global;

  @override
  String get uri => '${super.uri}/${global.value}';
}

abstract class NavigationPath extends GlobalPath {
  const NavigationPath(GlobalPathType global, this.navigation) : super(global);

  final NavigationPathType navigation;

  @override
  String get uri => '${super.uri}/${navigation.value}';
}

abstract class LocalPath extends NavigationPath {
  LocalPath(GlobalPathType global, NavigationPathType navigation) : super(global, navigation);

  @override
  String get uri => '${super.uri}/${'some value'}';
}

class

enum GlobalPathType {
  signIn,
  signUp,
  home,
}

extension ExtGlobal on GlobalPathType {
  String get value => 'value';
}

enum NavigationPathType { myPage }

extension ExtNavigation on NavigationPathType {
  String get value => 'value';
}
