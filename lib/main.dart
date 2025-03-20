// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/firebase_options.dart';
import 'package:JCSGuidelines/theme.dart';

void main() async {
  // runZonedGuardedで全体を新しいエラーゾーンを定義
  await runZonedGuarded(() async {
    // ensureInitialized()を呼んでおきます。
    WidgetsFlutterBinding.ensureInitialized();

    // Firebaseアプリを初期化します
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //Flutterでキャッチされた例外/エラー
    //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    //画面の設定など--------------------------------------------------------
    // 画面の向きを固定.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // ステータスバーの表示設定
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    //スプラッシュ画面の設定など--------------------------------------------------------
    //スプラッシュ画面の表示固定
    //FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    runApp(ProviderScope(child: MyApp()));
  }, (error, stackTrace) {
    //Flutterでキャッチされなかった例外/エラー
    //FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends HookConsumerWidget with WidgetsBindingObserver {
  MyApp({super.key});

  // ルートを監視するためのグローバルなオブジェクト
  final _appRouter = AppRouter(); //追加

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInit = useState(false);
    final isInitError = useState(false);

    Future<void> initServicesWithTimeout() async {
      var isInitComplete = false; // 初期化が完了したかのフラグ

      // タイムアウトの時間を設定します
      var timeoutDuration = const Duration(seconds: 10);
      // タイムアウトを設定したFutureを作成します。
      var timeoutFuture = Future.delayed(timeoutDuration).then((_) {
        if (!isInitComplete) {
          // 初期化が完了していない場合のみエラーをスロー
          throw TimeoutException('Initialization process timed out');
        }
      });

      try {
        // タイムアウトFutureと初期化処理Futureを並行して実行します。
        await Future.any([
          Future(() async {}),
          timeoutFuture,
        ]);
      } on TimeoutException {
        // タイムアウトした場合の処理をここに書きます。
        isInitError.value = true;
      }
    }

    useEffect(() {
      customDebugPrint('アプリ起動');
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // ステータスバーの色
            statusBarIconBrightness: Brightness.dark // ステータスバーのアイコンの明るさ（色）
            ),
      );
      Future<void>(() async {
        await initServicesWithTimeout();
      });

      return () {};
    }, []);

    return ScreenUtilInit(
      // デザイン原案におけるデバイス画面の大きさ(単位：dp)
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        // routerを追加
        routerConfig: _appRouter.config(),

        title: 'APP',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          // その他のテーマ設定

          //elavatedButton
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.r),
              ),
              backgroundColor: const Color(0xFF005CA2),
              foregroundColor: const Color(0xFFF0F0F0),
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 15.h,
              ),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //テキストボタン
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF005CA2),
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 15.h,
              ),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // AppBar
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            color: const Color(0xFFF6F6F6),
            iconTheme: const IconThemeData(
              color: Colors.black, // Change the color of the back button icon
            ),
          ),
          //TextField
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Color(0xFFE8E8E8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Color(0xFFE8E8E8),
              ),
            ),
            hintStyle: const TextStyle(
              color: Color(0xFFBDBDBD),
            ),
          ),
          //Card
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 0,
            margin: EdgeInsets.zero,
          ),
          //tile
          listTileTheme: ListTileThemeData(
            textColor: Colors.black,
            style: ListTileStyle.list,
            titleTextStyle: TextStyle(
              fontSize: 20.0.sp,
              color: Colors.black,
            ),
          ),
          //
        ),
        localizationsDelegates: const [
          FlutterQuillLocalizations.delegate, // これを追加
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ja", "JP"),
        ],
        // home: const HomePage(), // homeを削除
      ),

      child: Scaffold(
        body: Center(
          child: isInitError.value
              ? const Text('初期化エラー')
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
