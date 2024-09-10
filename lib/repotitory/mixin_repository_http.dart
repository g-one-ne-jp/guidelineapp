import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/debug/debug_print.dart';

import 'modules/repository_http_api_result.dart';

var _accessToken = '';

Dio? dio;
CancelToken cancelToken = CancelToken();
mixin RepositoryHttp {
  /// リポジトリのHTTPベースURLです。
  ///
  /// [kProfileMode]がtrueの場合は'https://'を返します。
  /// [kReleaseMode]がtrueの場合は'https://'を返します。
  /// [kDebugMode]がtrueの場合は'https://'を返します。
  /// それ以外の場合は'https://'を返します。
  static const String baseUrl = kProfileMode
      ? 'https://'
      : kReleaseMode
          ? 'https://'
          : kDebugMode
              ? 'https://'
              : 'https://';

  /// リポジトリのHTTPクライアントを返します。
  ///
  /// [Dio] インスタンスを作成し、必要なオプションを設定します。
  /// オプションには、ベースURL、ヘッダー、タイムアウトなどが含まれます。
  /// また、HTTPクライアントアダプターを設定し、証明書の検証を無効化します。
  ///
  /// リクエストとレスポンスのログを取得するためのインターセプターも追加されます。
  ///
  /// [dio] インスタンスが既に作成されている場合、ヘッダーのみ更新されます。
  ///
  /// 返り値は [Dio] インスタンスです。
  Dio _dioClient() {
    if (dio == null) {
      dio = Dio()
        ..options.baseUrl = baseUrl
        ..options.headers = httpPostHeader()
        ..options.connectTimeout = const Duration(seconds: 15) // 15 seconds
        ..options.sendTimeout = const Duration(seconds: 15) // 15 seconds
        ..options.receiveTimeout = const Duration(seconds: 15) // 15 seconds
        ..httpClientAdapter;

      dio!.interceptors.add(
        LogInterceptor(
            responseBody: true,
            error: true,
            requestHeader: true,
            responseHeader: true,
            request: true,
            requestBody: true),
      );
      dio!.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );
    } else {
      dio!.options.headers = (httpPostHeader());
    }
    return dio!;
  }

  /// Dioをクリアするメソッドです。
  void dioClear() {
    try {
      if (dio != null) {
        cancelToken.cancel("キャンセルを実行");
        cancelToken = CancelToken();
      }
    } catch (e) {
      customDebugPrint('dioClear:::$e');
    }
  }

  /// Dioを破棄するメソッドです。
  void dioDispose() {
    try {
      if (dio != null) {
        dio!.close();
        dio = null;
      }
    } catch (e) {
      customDebugPrint('dioDispose:::$e');
    }
  }

  //ヘッダー生成
  Map<String, String> httpPostHeader() {
    Map<String, String> result = {
      'Content-Type': 'application/json',
    };
    if (_accessToken.isNotEmpty) {
      result['Authorization'] = _accessToken;
    }
    return result;
  }

  /// HTTP GETリクエストを送信し、レスポンスを取得します。
  ///
  /// [uri] - リクエストの送信先URIです。
  /// [fromJson] - レスポンスのJSONデータをオブジェクトに変換するための関数です。
  /// [queryParameters] - クエリパラメータのマップです。デフォルトは空のマップです。
  /// [options] - 追加のリクエストオプションです。デフォルトはnullです。
  /// [onReceiveProgress] - レスポンスの受信進捗状況を監視するためのコールバック関数です。
  ///
  /// 返り値は、[ApiResult<T>]型のFutureです。
  Future<ApiResult<T>> get<T>(
    String uri,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var startTime = DateTime.now(); // 開始時のタイムスタンプを取得

      // ignore: avoid_print
      customDebugPrint('uri:get $uri');
      final u = '$baseUrl$uri';
      final dio = _dioClient();
      var response = await dio.get(
        u,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      final data = fromJson(response.data);
      var endTime = DateTime.now(); // 終了時のタイムスタンプを取得
      var elapsedTime = endTime.difference(startTime); // 通信時間を計算
      customDebugPrint(
          'Elapsed time: ${elapsedTime.inMilliseconds} ms   Get:$uri');

      return ApiResult.success(data);
    } on Exception catch (error) {
      return _checkError(
        method: 'get',
        uri: uri,
        error: error,
        payload: {},
      );
    }
  }

  /// HTTPリクエストを行い、POSTメソッドでデータを送信します。
  ///
  /// [uri] - リクエスト先のURI
  /// [fromJson] - レスポンスデータをデシリアライズするための関数
  /// [queryParameters] - クエリパラメーター（デフォルトは空のマップ）
  /// [options] - 追加のリクエストオプション（デフォルトはnull）
  /// [onSendProgress] - 送信プログレスコールバック（デフォルトはnull）
  /// [onReceiveProgress] - 受信プログレスコールバック（デフォルトはnull）
  ///
  /// 返り値: [ApiResult<T>] - APIの結果を表すオブジェクト
  Future<ApiResult<T>> post<T>(
    String uri,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var startTime = DateTime.now(); // 開始時のタイムスタンプを取得
      // ignore: avoid_print
      customDebugPrint('uri:post $uri');
      //print('payload:post $queryParameters');
      final u = '$baseUrl$uri';
      final dio = _dioClient();

      var response = await dio.post(
        u,
        data: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      var endTime = DateTime.now(); // 終了時のタイムスタンプを取得
      var elapsedTime = endTime.difference(startTime); // 通信時間を計算
      customDebugPrint(
          'Elapsed time: ${elapsedTime.inMilliseconds} ms   post:$uri');

      return ApiResult.success(fromJson(response.data));
    } on Exception catch (error) {
      return _checkError(
        method: 'post',
        uri: uri,
        error: error,
        payload: queryParameters,
      );
    }
  }

  /// 指定されたURIに対してDELETEリクエストを送信します。
  ///
  /// [uri] - リクエストを送信するURI
  /// [fromJson] - レスポンスのJSONデータをオブジェクトに変換するための関数
  /// [queryParameters] - クエリパラメーター（デフォルトは空のマップ）
  /// [options] - 追加のリクエストオプション（デフォルトはnull）
  /// [onSendProgress] - リクエスト送信の進捗状況を監視するためのコールバック関数（デフォルトはnull）
  /// [onReceiveProgress] - レスポンス受信の進捗状況を監視するためのコールバック関数（デフォルトはnull）
  ///
  /// 返り値: Future<ApiResult<T>> - APIの結果を表すFutureオブジェクト
  Future<ApiResult<T>> delete<T>(
    String uri,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var startTime = DateTime.now(); // 開始時のタイムスタンプを取得
    try {
      T? data;
      // ignore: avoid_print
      customDebugPrint('uri:delete $uri');
      final u = '$baseUrl$uri';
      final dio = _dioClient();

      var response = await dio.delete(
        u,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      data = fromJson(response.data as Map<String, dynamic>);

      var endTime = DateTime.now(); // 終了時のタイムスタンプを取得
      var elapsedTime = endTime.difference(startTime); // 通信時間を計算
      customDebugPrint(
          'Elapsed time: ${elapsedTime.inMilliseconds} ms   delete:$uri');

      return ApiResult.success(data as T);
    } on Exception catch (error) {
      return _checkError(
        method: 'delete',
        uri: uri,
        error: error,
        payload: {},
      );
    }
  }

  /// HTTPのPUTリクエストを送信し、レスポンスを返します。
  ///
  /// [uri]にはリクエストを送信するURLを指定します。
  /// [fromJson]にはレスポンスのJSONデータをパースするための関数を指定します。
  /// [queryParameters]にはクエリパラメータを指定します。デフォルトは空のマップです。
  /// [options]にはリクエストのオプションを指定します。デフォルトはnullです。
  /// [onSendProgress]にはリクエストの進捗状況を監視するためのコールバック関数を指定します。デフォルトはnullです。
  /// [onReceiveProgress]にはレスポンスの進捗状況を監視するためのコールバック関数を指定します。デフォルトはnullです。
  ///
  /// リクエストの結果は[ApiResult]オブジェクトとして返されます。
  Future<ApiResult<T>> put<T>(
    String uri,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var startTime = DateTime.now(); // 開始時のタイムスタンプを取得
    try {
      // ignore: avoid_print
      customDebugPrint('uri:put $uri');
      final u = '$baseUrl$uri';
      final dio = _dioClient();

      var response = await dio.put(
        u,
        data: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final data = fromJson(response.data);

      var endTime = DateTime.now(); // 終了時のタイムスタンプを取得
      var elapsedTime = endTime.difference(startTime); // 通信時間を計算
      customDebugPrint(
          'Elapsed time: ${elapsedTime.inMilliseconds} ms   put:$uri');
      return ApiResult.success(data);
    } on Exception catch (error) {
      return _checkError(
        method: 'put',
        uri: uri,
        error: error,
        payload: {},
      );
    }
  }

  //通信エラー判定を行う（エンドポイントとレスポンスを見て判定） エラーメッセージをダイアログで表示
  Future<ApiResult<T>> _checkError<T>({
    required String method,
    required String uri,
    required Exception error,
    required Map<dynamic, dynamic> payload,
  }) async {
    var apiResultMessage = '';

    if (error.runtimeType == DioException) {
      final result = error as DioException;
      if (result.type == DioExceptionType.cancel) {
        customDebugPrint('$error--------------------リクエストがキャンセルされました');
        return ApiResult.failure(apiResultMessage);
      }
      // 接続タイムアウトの場合の処理
      else if (result.type == DioExceptionType.connectionTimeout) {
        return ApiResult.failure(apiResultMessage);
      } // 送信タイムアウトの場合の処理
      else if (result.type == DioExceptionType.sendTimeout) {
        return ApiResult.failure(apiResultMessage);
      } // 受信タイムアウトの場合の処理
      else if (result.type == DioExceptionType.receiveTimeout) {
        return ApiResult.failure(apiResultMessage);
      }
      //レスポンスがあるか？
      else if (result.response != null) {
        //各レスポンスでエラー表示
        switch (result.response!.statusCode) {
          case 400:
          case 401:
          case 403:
          case 404:
          case 406:
          case 409:
          case 500:
          case 502:
          case 501:
          case 503:
          case 504:
          case 505:
            return ApiResult.failure(apiResultMessage);

          default:
            return ApiResult.failure(apiResultMessage);
        }
      } else {
        customDebugPrint('$error--------------------接続が確立できなかった');
      }
    } else {}
    return ApiResult.failure(apiResultMessage);
  }
}
