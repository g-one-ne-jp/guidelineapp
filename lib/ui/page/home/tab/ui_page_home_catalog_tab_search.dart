import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/module/firebase/model_firebase_user.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class UiPageHomeCatalogTabSearch extends HookConsumerWidget
    with RepositoryFireStore {
  UiPageHomeCatalogTabSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tos = useState(ModelFirebasePdfConfig());
    final _panelController = useState(PanelController());
    final _isOpen = useState(false);

    useEffect(() {
      Future<void>(() async {
        //ユーザーデータを読み込み
        final user = await readUser<ModelFirebaseUser>(
            fromJson: ModelFirebaseUser.fromJson);
        //ユーザーデータがないときは新規作成
        if (user == ModelFirebaseUser()) {
          customDebugPrint('ユーザーデータがないので新規作成します');
          await writeUser(
            data: ModelFirebaseUser().toJson(),
          );
        }

        _tos.value = await readTocs();
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Container(
      color: Colors.grey,
    );
  }
}
