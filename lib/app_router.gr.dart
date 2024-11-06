// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    UiRouteEmailVerification.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiPageEmailVerification(),
      );
    },
    UiRouteHome.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeArgs>(
          orElse: () => const UiRouteHomeArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHome(key: args.key),
      );
    },
    UiRouteHomeCatalog.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeCatalogArgs>(
          orElse: () => const UiRouteHomeCatalogArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalog(key: args.key),
      );
    },
    UiRouteHomeCatalogTabBookmark.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeCatalogTabBookmarkArgs>(
          orElse: () => const UiRouteHomeCatalogTabBookmarkArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabBookmark(key: args.key),
      );
    },
    UiRouteHomeCatalogTabHome.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeCatalogTabHomeArgs>(
          orElse: () => const UiRouteHomeCatalogTabHomeArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabHome(key: args.key),
      );
    },
    UiRouteHomeCatalogTabHomeMinor.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UiRouteHomeCatalogTabHomeMinorArgs>(
          orElse: () => UiRouteHomeCatalogTabHomeMinorArgs(
                mainorKey: pathParams.getString('mainorKey'),
                viewTypeMemo: pathParams.getBool('viewTypeMemo'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabHomeMinor(
          key: args.key,
          mainorKey: args.mainorKey,
          viewTypeMemo: args.viewTypeMemo,
        ),
      );
    },
    UiRouteHomeCatalogTabMemo.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiPageHomeCatalogTabMemo(),
      );
    },
    UiRouteHomeCatalogTabMypage.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeCatalogTabMypageArgs>(
          orElse: () => const UiRouteHomeCatalogTabMypageArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabMypage(key: args.key),
      );
    },
    UiRouteHomeCatalogTabSearch.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiPageHomeCatalogTabSearch(),
      );
    },
    UiRouteLogin.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiPageLogin(),
      );
    },
    UiRouteProfileCreate.name: (routeData) {
      final args = routeData.argsAs<UiRouteProfileCreateArgs>(
          orElse: () => const UiRouteProfileCreateArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageProfileCreate(key: args.key),
      );
    },
    UiRouteSingup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiPageSingup(),
      );
    },
  };
}

/// generated route for
/// [UiPageEmailVerification]
class UiRouteEmailVerification extends PageRouteInfo<void> {
  const UiRouteEmailVerification({List<PageRouteInfo>? children})
      : super(
          UiRouteEmailVerification.name,
          initialChildren: children,
        );

  static const String name = 'UiRouteEmailVerification';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiPageHome]
class UiRouteHome extends PageRouteInfo<UiRouteHomeArgs> {
  UiRouteHome({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHome.name,
          args: UiRouteHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHome';

  static const PageInfo<UiRouteHomeArgs> page = PageInfo<UiRouteHomeArgs>(name);
}

class UiRouteHomeArgs {
  const UiRouteHomeArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageHomeCatalog]
class UiRouteHomeCatalog extends PageRouteInfo<UiRouteHomeCatalogArgs> {
  UiRouteHomeCatalog({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalog.name,
          args: UiRouteHomeCatalogArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalog';

  static const PageInfo<UiRouteHomeCatalogArgs> page =
      PageInfo<UiRouteHomeCatalogArgs>(name);
}

class UiRouteHomeCatalogArgs {
  const UiRouteHomeCatalogArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabBookmark]
class UiRouteHomeCatalogTabBookmark
    extends PageRouteInfo<UiRouteHomeCatalogTabBookmarkArgs> {
  UiRouteHomeCatalogTabBookmark({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabBookmark.name,
          args: UiRouteHomeCatalogTabBookmarkArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabBookmark';

  static const PageInfo<UiRouteHomeCatalogTabBookmarkArgs> page =
      PageInfo<UiRouteHomeCatalogTabBookmarkArgs>(name);
}

class UiRouteHomeCatalogTabBookmarkArgs {
  const UiRouteHomeCatalogTabBookmarkArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabBookmarkArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabHome]
class UiRouteHomeCatalogTabHome
    extends PageRouteInfo<UiRouteHomeCatalogTabHomeArgs> {
  UiRouteHomeCatalogTabHome({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabHome.name,
          args: UiRouteHomeCatalogTabHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabHome';

  static const PageInfo<UiRouteHomeCatalogTabHomeArgs> page =
      PageInfo<UiRouteHomeCatalogTabHomeArgs>(name);
}

class UiRouteHomeCatalogTabHomeArgs {
  const UiRouteHomeCatalogTabHomeArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabHomeArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabHomeMinor]
class UiRouteHomeCatalogTabHomeMinor
    extends PageRouteInfo<UiRouteHomeCatalogTabHomeMinorArgs> {
  UiRouteHomeCatalogTabHomeMinor({
    Key? key,
    required String mainorKey,
    required bool viewTypeMemo,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabHomeMinor.name,
          args: UiRouteHomeCatalogTabHomeMinorArgs(
            key: key,
            mainorKey: mainorKey,
            viewTypeMemo: viewTypeMemo,
          ),
          rawPathParams: {
            'mainorKey': mainorKey,
            'viewTypeMemo': viewTypeMemo,
          },
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabHomeMinor';

  static const PageInfo<UiRouteHomeCatalogTabHomeMinorArgs> page =
      PageInfo<UiRouteHomeCatalogTabHomeMinorArgs>(name);
}

class UiRouteHomeCatalogTabHomeMinorArgs {
  const UiRouteHomeCatalogTabHomeMinorArgs({
    this.key,
    required this.mainorKey,
    required this.viewTypeMemo,
  });

  final Key? key;

  final String mainorKey;

  final bool viewTypeMemo;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabHomeMinorArgs{key: $key, mainorKey: $mainorKey, viewTypeMemo: $viewTypeMemo}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabMemo]
class UiRouteHomeCatalogTabMemo extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabMemo({List<PageRouteInfo>? children})
      : super(
          UiRouteHomeCatalogTabMemo.name,
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabMemo';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiPageHomeCatalogTabMypage]
class UiRouteHomeCatalogTabMypage
    extends PageRouteInfo<UiRouteHomeCatalogTabMypageArgs> {
  UiRouteHomeCatalogTabMypage({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabMypage.name,
          args: UiRouteHomeCatalogTabMypageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabMypage';

  static const PageInfo<UiRouteHomeCatalogTabMypageArgs> page =
      PageInfo<UiRouteHomeCatalogTabMypageArgs>(name);
}

class UiRouteHomeCatalogTabMypageArgs {
  const UiRouteHomeCatalogTabMypageArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabMypageArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabSearch]
class UiRouteHomeCatalogTabSearch extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabSearch({List<PageRouteInfo>? children})
      : super(
          UiRouteHomeCatalogTabSearch.name,
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabSearch';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiPageLogin]
class UiRouteLogin extends PageRouteInfo<void> {
  const UiRouteLogin({List<PageRouteInfo>? children})
      : super(
          UiRouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'UiRouteLogin';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiPageProfileCreate]
class UiRouteProfileCreate extends PageRouteInfo<UiRouteProfileCreateArgs> {
  UiRouteProfileCreate({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteProfileCreate.name,
          args: UiRouteProfileCreateArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteProfileCreate';

  static const PageInfo<UiRouteProfileCreateArgs> page =
      PageInfo<UiRouteProfileCreateArgs>(name);
}

class UiRouteProfileCreateArgs {
  const UiRouteProfileCreateArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteProfileCreateArgs{key: $key}';
  }
}

/// generated route for
/// [UiPageSingup]
class UiRouteSingup extends PageRouteInfo<void> {
  const UiRouteSingup({List<PageRouteInfo>? children})
      : super(
          UiRouteSingup.name,
          initialChildren: children,
        );

  static const String name = 'UiRouteSingup';

  static const PageInfo<void> page = PageInfo<void>(name);
}
