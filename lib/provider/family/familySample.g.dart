// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familySample.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testHash() => r'6c68c25664b7e64a5bb30f109ff543ede5b28669';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [test].
@ProviderFor(test)
const testProvider = TestFamily();

/// See also [test].
class TestFamily extends Family<AsyncValue<List<int>>> {
  /// See also [test].
  const TestFamily();

  /// See also [test].
  TestProvider call({
    required String category,
    int limit = 50,
  }) {
    return TestProvider(
      category: category,
      limit: limit,
    );
  }

  @override
  TestProvider getProviderOverride(
    covariant TestProvider provider,
  ) {
    return call(
      category: provider.category,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'testProvider';
}

/// See also [test].
class TestProvider extends AutoDisposeFutureProvider<List<int>> {
  /// See also [test].
  TestProvider({
    required String category,
    int limit = 50,
  }) : this._internal(
          (ref) => test(
            ref as TestRef,
            category: category,
            limit: limit,
          ),
          from: testProvider,
          name: r'testProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$testHash,
          dependencies: TestFamily._dependencies,
          allTransitiveDependencies: TestFamily._allTransitiveDependencies,
          category: category,
          limit: limit,
        );

  TestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
    required this.limit,
  }) : super.internal();

  final String category;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<int>> Function(TestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestProvider._internal(
        (ref) => create(ref as TestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<int>> createElement() {
    return _TestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestProvider && other.category == category && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestRef on AutoDisposeFutureProviderRef<List<int>> {
  /// The parameter `category` of this provider.
  String get category;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _TestProviderElement extends AutoDisposeFutureProviderElement<List<int>> with TestRef {
  _TestProviderElement(super.provider);

  @override
  String get category => (origin as TestProvider).category;
  @override
  int get limit => (origin as TestProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
