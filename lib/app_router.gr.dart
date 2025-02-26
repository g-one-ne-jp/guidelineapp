// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [UiPageEmailVerification]
class UiRouteEmailVerification extends PageRouteInfo<void> {
  const UiRouteEmailVerification({List<PageRouteInfo>? children})
    : super(UiRouteEmailVerification.name, initialChildren: children);

  static const String name = 'UiRouteEmailVerification';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageEmailVerification();
    },
  );
}

/// generated route for
/// [UiPageHome]
class UiRouteHome extends PageRouteInfo<void> {
  const UiRouteHome({List<PageRouteInfo>? children})
    : super(UiRouteHome.name, initialChildren: children);

  static const String name = 'UiRouteHome';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHome();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalog]
class UiRouteHomeCatalog extends PageRouteInfo<void> {
  const UiRouteHomeCatalog({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalog.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalog';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalog();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalogTabBookmark]
class UiRouteHomeCatalogTabBookmark extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabBookmark({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalogTabBookmark.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalogTabBookmark';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalogTabBookmark();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalogTabHome]
class UiRouteHomeCatalogTabHome
    extends PageRouteInfo<UiRouteHomeCatalogTabHomeArgs> {
  UiRouteHomeCatalogTabHome({Key? key, List<PageRouteInfo>? children})
    : super(
        UiRouteHomeCatalogTabHome.name,
        args: UiRouteHomeCatalogTabHomeArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'UiRouteHomeCatalogTabHome';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UiRouteHomeCatalogTabHomeArgs>(
        orElse: () => const UiRouteHomeCatalogTabHomeArgs(),
      );
      return UiPageHomeCatalogTabHome(key: args.key);
    },
  );
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
    required String minorKey,
    required bool viewTypeMemo,
    List<PageRouteInfo>? children,
  }) : super(
         UiRouteHomeCatalogTabHomeMinor.name,
         args: UiRouteHomeCatalogTabHomeMinorArgs(
           key: key,
           minorKey: minorKey,
           viewTypeMemo: viewTypeMemo,
         ),
         rawPathParams: {'minorKey': minorKey, 'viewTypeMemo': viewTypeMemo},
         initialChildren: children,
       );

  static const String name = 'UiRouteHomeCatalogTabHomeMinor';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<UiRouteHomeCatalogTabHomeMinorArgs>(
        orElse:
            () => UiRouteHomeCatalogTabHomeMinorArgs(
              minorKey: pathParams.getString('minorKey'),
              viewTypeMemo: pathParams.getBool('viewTypeMemo'),
            ),
      );
      return UiPageHomeCatalogTabHomeMinor(
        key: args.key,
        minorKey: args.minorKey,
        viewTypeMemo: args.viewTypeMemo,
      );
    },
  );
}

class UiRouteHomeCatalogTabHomeMinorArgs {
  const UiRouteHomeCatalogTabHomeMinorArgs({
    this.key,
    required this.minorKey,
    required this.viewTypeMemo,
  });

  final Key? key;

  final String minorKey;

  final bool viewTypeMemo;

  @override
  String toString() {
    return 'UiRouteHomeCatalogTabHomeMinorArgs{key: $key, minorKey: $minorKey, viewTypeMemo: $viewTypeMemo}';
  }
}

/// generated route for
/// [UiPageHomeCatalogTabHomeTOC]
class UiRouteHomeCatalogTabHomeTOC extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabHomeTOC({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalogTabHomeTOC.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalogTabHomeTOC';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalogTabHomeTOC();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalogTabMemo]
class UiRouteHomeCatalogTabMemo extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabMemo({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalogTabMemo.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalogTabMemo';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalogTabMemo();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalogTabMypage]
class UiRouteHomeCatalogTabMypage extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabMypage({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalogTabMypage.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalogTabMypage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalogTabMypage();
    },
  );
}

/// generated route for
/// [UiPageHomeCatalogTabSearch]
class UiRouteHomeCatalogTabSearch extends PageRouteInfo<void> {
  const UiRouteHomeCatalogTabSearch({List<PageRouteInfo>? children})
    : super(UiRouteHomeCatalogTabSearch.name, initialChildren: children);

  static const String name = 'UiRouteHomeCatalogTabSearch';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageHomeCatalogTabSearch();
    },
  );
}

/// generated route for
/// [UiPageLogin]
class UiRouteLogin extends PageRouteInfo<void> {
  const UiRouteLogin({List<PageRouteInfo>? children})
    : super(UiRouteLogin.name, initialChildren: children);

  static const String name = 'UiRouteLogin';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageLogin();
    },
  );
}

/// generated route for
/// [UiPageProfileCreate]
class UiRouteProfileCreate extends PageRouteInfo<void> {
  const UiRouteProfileCreate({List<PageRouteInfo>? children})
    : super(UiRouteProfileCreate.name, initialChildren: children);

  static const String name = 'UiRouteProfileCreate';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageProfileCreate();
    },
  );
}

/// generated route for
/// [UiPageSingup]
class UiRouteSingup extends PageRouteInfo<void> {
  const UiRouteSingup({List<PageRouteInfo>? children})
    : super(UiRouteSingup.name, initialChildren: children);

  static const String name = 'UiRouteSingup';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UiPageSingup();
    },
  );
}

/// generated route for
/// [UiPageUtilEdit]
class UiRouteUtilEdit extends PageRouteInfo<UiRouteUtilEditArgs> {
  UiRouteUtilEdit({
    Key? key,
    required String minorKey,
    required bool viewTypeMemo,
    List<PageRouteInfo>? children,
  }) : super(
         UiRouteUtilEdit.name,
         args: UiRouteUtilEditArgs(
           key: key,
           minorKey: minorKey,
           viewTypeMemo: viewTypeMemo,
         ),
         rawPathParams: {'minorKey': minorKey, 'viewTypeMemo': viewTypeMemo},
         initialChildren: children,
       );

  static const String name = 'UiRouteUtilEdit';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<UiRouteUtilEditArgs>(
        orElse:
            () => UiRouteUtilEditArgs(
              minorKey: pathParams.getString('minorKey'),
              viewTypeMemo: pathParams.getBool('viewTypeMemo'),
            ),
      );
      return UiPageUtilEdit(
        key: args.key,
        minorKey: args.minorKey,
        viewTypeMemo: args.viewTypeMemo,
      );
    },
  );
}

class UiRouteUtilEditArgs {
  const UiRouteUtilEditArgs({
    this.key,
    required this.minorKey,
    required this.viewTypeMemo,
  });

  final Key? key;

  final String minorKey;

  final bool viewTypeMemo;

  @override
  String toString() {
    return 'UiRouteUtilEditArgs{key: $key, minorKey: $minorKey, viewTypeMemo: $viewTypeMemo}';
  }
}
