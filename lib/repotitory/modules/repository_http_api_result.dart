import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_http_api_result.freezed.dart';

/// APIの結果を表すクラスです。
/// [T]はAPIのレスポンスの型を表します。
@freezed
class ApiResult<T> with _$ApiResult<T> {
  /// デフォルトのコンストラクタです。
  const factory ApiResult() = _ApiResult;

  /// 成功時のAPIの結果を表すコンストラクタです。
  /// [value]にはAPIのレスポンスが格納されます。
  const factory ApiResult.success(T value) = Success<T>;

  /// 失敗時のAPIの結果を表すコンストラクタです。
  /// [error]にはエラーの詳細が格納されます。
  const factory ApiResult.failure(Object error) = Failure<T>;
}
