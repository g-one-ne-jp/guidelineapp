import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestorage.dart';
import 'package:flutter_template/ui/page/home/tab/ui_page_home_catalog_tab_home.dart';
import 'package:flutter_template/ui/page/home/ui_page_home.dart';
import 'package:flutter_template/ui/util/uiUtilWidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
// ignore: must_be_immutable
class FunctionPagePdfEdit extends HookConsumerWidget {
  const FunctionPagePdfEdit({
    super.key,
    @PathParam('path') required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String _version = 'Unknown';
    String _document =
        "https://pdftron.s3.amazonaws.com/downloads/pl/PDFTRON_mobile_about.pdf";
    bool _showViewer = true;
    final _settions = useState(<Widget>[]);

    // Platform messages are asynchronous, so initialize in an async method.
    Future<void> initPlatformState() async {
      String version;
      // Platform messages may fail, so use a try/catch PlatformException.
      try {
        // Initializes the PDFTron SDK, it must be called before you can use any functionality.
        PdftronFlutter.initialize("your_pdftron_license_key");

        version = await PdftronFlutter.version;
      } on PlatformException {
        version = 'Failed to get platform version.';
      }
    }

    void showViewer() async {
      // opening without a config file will have all functionality enabled.
      // await PdftronFlutter.openDocument(_document);

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

      await PdftronFlutter.openDocument(_document, config: config);

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

      try {
        // Adds a bookmark into the document.
        PdftronFlutter.importBookmarkJson('{"0":"Page 1"}');
      } on PlatformException catch (e) {
        print("Failed to importBookmarkJson '${e.message}'.");
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

      // An event listener for when local bookmark changes are committed to the document.
      // bookmarkJson is JSON string containing all the bookmarks that exist when the change was made.
      var bookmarkCancel = startExportBookmarkListener((bookmarkJson) {
        print("flutter bookmark: $bookmarkJson");
      });

      var path = await PdftronFlutter.saveDocument();
      print("flutter save: $path");

      // To cancel event:
      // annotCancel();
      // bookmarkCancel();
      // documentLoadedCancel();
    }

    Future<void> _showMyDialog() async {
      print('hello');
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // User must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: SingleChildScrollView(
              child: Text('Leading navigation button has been pressed.'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

// This function is used to control the DocumentView widget after it has been created.
    // The widget will not work without a void Function(DocumentViewController controller) being passed to it.
    void _onDocumentViewCreated(DocumentViewController controller) async {
      Config config = new Config();

      var leadingNavCancel = startLeadingNavButtonPressedListener(() {
        // Uncomment this to quit the viewer when leading navigation button is pressed.
        // this.setState(() {
        //   _showViewer = !_showViewer;
        // });

        // Show a dialog when leading navigation button is pressed.
        _showMyDialog();
      });

      controller.openDocument(_document, config: config);
    }

    useEffect(() {
      initPlatformState();

      showViewer();

      // If you are using local files delete the line above, change the _document field
      // appropriately and uncomment the section below.
      // if (Platform.isIOS) {
      // // Open the document for iOS, no need for permission.
      // showViewer();
      // } else {
      // // Request permission for Android before opening document.
      // launchWithPermission();
      // }
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child:
            // Uncomment this to use Widget version of the viewer.
            // _showViewer
            Container(),
      ),
    );
  }
}
