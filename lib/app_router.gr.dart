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
    FunctionRoutePdfEdit.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FunctionRoutePdfEditArgs>(
          orElse: () =>
              FunctionRoutePdfEditArgs(path: pathParams.getString('path')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FunctionPagePdfEdit(
          key: args.key,
          path: args.path,
        ),
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
              mainorKey: pathParams.getString('mainorKey')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabHomeMinor(
          key: args.key,
          mainorKey: args.mainorKey,
        ),
      );
    },
    UiRouteHomeCatalogTabMemo.name: (routeData) {
      final args = routeData.argsAs<UiRouteHomeCatalogTabMemoArgs>(
          orElse: () => const UiRouteHomeCatalogTabMemoArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabMemo(key: args.key),
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
      final args = routeData.argsAs<UiRouteHomeCatalogTabSearchArgs>(
          orElse: () => const UiRouteHomeCatalogTabSearchArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UiPageHomeCatalogTabSearch(key: args.key),
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
/// [FunctionPagePdfEdit]
class FunctionRoutePdfEdit extends PageRouteInfo<FunctionRoutePdfEditArgs> {
  FunctionRoutePdfEdit({
    Key? key,
    required String path,
    List<PageRouteInfo>? children,
  }) : super(
          FunctionRoutePdfEdit.name,
          args: FunctionRoutePdfEditArgs(
            key: key,
            path: path,
          ),
          rawPathParams: {'path': path},
          initialChildren: children,
        );

  static const String name = 'FunctionRoutePdfEdit';

  static const PageInfo<FunctionRoutePdfEditArgs> page =
      PageInfo<FunctionRoutePdfEditArgs>(name);
}

class FunctionRoutePdfEditArgs {
  const FunctionRoutePdfEditArgs({
    this.key,
    required this.path,
  });

  final Key? key;

  final String path;

  @override
  String toString() {
    return 'FunctionRoutePdfEditArgs{key: $key, path: $path}';
  }
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
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabHomeMinor.name,
          args: UiRouteHomeCatalogTabHomeMinorArgs(
            key: key,
            mainorKey: mainorKey,
          ),
          rawPathParams: {'mainorKey': mainorKey},
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
  });

  final Key? key;

  final String mainorKey;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabHomeMinorArgs{key: $key, mainorKey: $mainorKey}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabMemo]
class UiRouteHomeCatalogTabMemo
    extends PageRouteInfo<UiRouteHomeCatalogTabMemoArgs> {
  UiRouteHomeCatalogTabMemo({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabMemo.name,
          args: UiRouteHomeCatalogTabMemoArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabMemo';

  static const PageInfo<UiRouteHomeCatalogTabMemoArgs> page =
      PageInfo<UiRouteHomeCatalogTabMemoArgs>(name);
}

class UiRouteHomeCatalogTabMemoArgs {
  const UiRouteHomeCatalogTabMemoArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabMemoArgs{key: $key}';
  }
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
class UiRouteHomeCatalogTabSearch
    extends PageRouteInfo<UiRouteHomeCatalogTabSearchArgs> {
  UiRouteHomeCatalogTabSearch({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UiRouteHomeCatalogTabSearch.name,
          args: UiRouteHomeCatalogTabSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UiRouteHomeCatalogTabSearch';

  static const PageInfo<UiRouteHomeCatalogTabSearchArgs> page =
      PageInfo<UiRouteHomeCatalogTabSearchArgs>(name);
}

class UiRouteHomeCatalogTabSearchArgs {
  const UiRouteHomeCatalogTabSearchArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabSearchArgs{key: $key}';
  }
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
