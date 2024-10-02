import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeMinor extends HookConsumerWidget
    with RepositoryFireStore {
  UiPageHomeCatalogTabHomeMinor({
    super.key,
    @PathParam('mainorKey') required this.mainorKey,
  });
  final String mainorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _mainor = useState(MinorCategory());

    final _isBookMark = useState(false);

    useEffect(() {
      Future<void>(() async {
        _mainor.value = _tocNotifer.searchMinorCategoryByKeyFromMajor(
            _tocProvider, mainorKey);
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(_mainor.value.minorTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                _isBookMark.value ? Icons.bookmark_outline : Icons.bookmark),
            onPressed: () {
              _isBookMark.value = !_isBookMark.value;
            },
          ),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: _mainor.value.details.length,
          itemBuilder: (BuildContext context, int index) {
            var value = _mainor.value.details.values.toList()[index];

            return UiUtilWidgetTile3(deteil: value, onMinorTap: (minor) {});
          },
        ),
      ),
    );
  }
}
