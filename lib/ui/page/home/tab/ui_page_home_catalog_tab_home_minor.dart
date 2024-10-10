import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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

    final _panelController = useState(PanelController());
    final _isOpen = useState(false);
    final _controller = useState(QuillController.basic());

    useEffect(() {
      Future<void>(() async {
        _mainor.value = _tocNotifer.searchMinorCategoryByKeyFromMajor(
            _tocProvider, mainorKey);
      });
      return () => customDebugPrint('dispose!');
    }, []);

    void showViewer({required String document}) async {
      //ビューワーのカスタムコンフィグ
      var config = Config();
      // How to disable functionality:
      //      config.disabledElements = [Buttons.shareButton, Buttons.searchButton];
      //      config.disabledTools = [Tools.annotationCreateLine, Tools.annotationCreateRectangle];
      // Other viewer configurations:
      //      config.multiTabEnabled = true;
      //      config.customHeaders = {'headerName': 'headerValue'};

      // An event listener for document loading
      var documentLoadedCancel = startDocumentLoadedListener((filePath) {
        print("document loaded: $filePath");
      });

      await PdftronFlutter.openDocument(document, config: config);

      try {
        // The imported command is in XFDF format and tells whether to add, modify or delete annotations in the current document.
        PdftronFlutter.importAnnotationCommand(
            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "    <xfdf xmlns=\"http://ns.adobe.com/xfdf/\" xml:space=\"preserve\">\n" +
                "      <add>\n" +
                "        <square style=\"solid\" width=\"5\" color=\"#E44234\" opacity=\"1\" creationdate=\"D:20200619203211Z\" flags=\"print\" date=\"D:20200619203211Z\" name=\"c684da06-12d2-4ccd-9361-0a1bf2e089e3\" page=\"1\" rect=\"113.312,277.056,235.43,350.173\" title=\"\" />\n" +
                "      </add>\n" +
                "      <modify />\n" +
                "      <delete />\n" +
                "      <pdf-info import-version=\"3\" version=\"2\" xmlns=\"http://www.pdftron.com/pdfinfo\" />\n" +
                "    </xfdf>");
      } on PlatformException catch (e) {
        print("Failed to importAnnotationCommand '${e.message}'.");
      }

      // An event listener for when local annotation changes are committed to the document.
      // xfdfCommand is the XFDF Command of the annotation that was last changed.
      var annotCancel = startExportAnnotationCommandListener((xfdfCommand) {
        String command = xfdfCommand;
        print("flutter xfdfCommand:\n");
        // Dart limits how many characters are printed onto the console.
        // The code below ensures that all of the XFDF command is printed.
        if (command.length > 1024) {
          int start = 0;
          int end = 1023;
          while (end < command.length) {
            print(command.substring(start, end) + "\n");
            start += 1024;
            end += 1024;
          }
          print(command.substring(start));
        } else {
          print("flutter xfdfCommand:\n $command");
        }
      });

      var path = await PdftronFlutter.saveDocument();
      print("flutter save: $path");

      var a = 0;
    }

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
      body: SlidingUpPanel(
        backdropEnabled: true,
        backdropOpacity: 0.7,
        backdropColor: Colors.black, // 16 進数のカラーコードでグレーを指定
        isDraggable: false,
        minHeight: 0,
        onPanelClosed: () {
          _isOpen.value = false;
        },
        controller: _panelController.value,
        panel: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(_mainor.value.minorTitle),
              leading: IconButton(
                icon: Icon(Icons.close), // バツアイコン
                onPressed: () {
                  _panelController.value.close();
                  _isOpen.value = false;
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).nextFocus();
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    _isOpen.value = false;
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ],
            ),
            Container(
              color: Colors.lightBlueAccent,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 子ウィジェットのスクロール方向
                child: QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    controller: _controller.value,
                    showItalicButton: false,
                    showHeaderStyle: false,
                    showUnderLineButton: false,
                    showListCheck: false,
                    showListNumbers: false,
                    showListBullets: false,
                    showIndent: false,
                    showRedo: true,
                    showUndo: true,
                    showSubscript: false,
                    showSearchButton: false,
                    showSuperscript: false,
                    showStrikeThrough: false,
                    showInlineCode: false,
                    showFontFamily: false,
                    showClearFormat: false,
                    showCodeBlock: false,
                    showQuote: false,
                    showBackgroundColorButton: false,
                    showDividers: false,
                    showClipboardCopy: false,
                    showClipboardCut: false,
                    showClipboardPaste: true,
                    showColorButton: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white70,
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    placeholder: 'ここをタップしてメモを入力してください。',
                    controller: _controller.value,
                    scrollable: true,
                    padding: const EdgeInsets.all(16.0),
                    autoFocus: false,
                    expands: false,
                  ),
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _mainor.value.details.length,
          itemBuilder: (BuildContext context, int index) {
            var value = _mainor.value.details.values.toList()[index];

            return UiUtilWidgetTile3(
                deteil: value,
                onPdfTap: (String path) {
                  showViewer(document: path);
                },
                onDeteilEdit: (deteil) {
                  if (_isOpen.value) {
                    _panelController.value.close();
                    _isOpen.value = false;
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).nextFocus();
                  } else {
                    _panelController.value.open();
                    _isOpen.value = true;
                  }
                });
          },
        ),
      ),
    );
  }
}
