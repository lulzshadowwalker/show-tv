// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seriesHash() => r'9923fb1643cf671e71ece504f76b9abd8e0f05aa';

/// See also [series].
@ProviderFor(series)
final seriesProvider = AutoDisposeStreamProvider<List<Series>>.internal(
  series,
  name: r'seriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$seriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SeriesRef = AutoDisposeStreamProviderRef<List<Series>>;
String _$singleSeriesHash() => r'877c2cd1791747df87efd92eee77e4a9316fcacf';

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

/// See also [singleSeries].
@ProviderFor(singleSeries)
const singleSeriesProvider = SingleSeriesFamily();

/// See also [singleSeries].
class SingleSeriesFamily extends Family<AsyncValue<Series>> {
  /// See also [singleSeries].
  const SingleSeriesFamily();

  /// See also [singleSeries].
  SingleSeriesProvider call(String id) {
    return SingleSeriesProvider(id);
  }

  @override
  SingleSeriesProvider getProviderOverride(
    covariant SingleSeriesProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'singleSeriesProvider';
}

/// See also [singleSeries].
class SingleSeriesProvider extends AutoDisposeStreamProvider<Series> {
  /// See also [singleSeries].
  SingleSeriesProvider(String id)
    : this._internal(
        (ref) => singleSeries(ref as SingleSeriesRef, id),
        from: singleSeriesProvider,
        name: r'singleSeriesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$singleSeriesHash,
        dependencies: SingleSeriesFamily._dependencies,
        allTransitiveDependencies:
            SingleSeriesFamily._allTransitiveDependencies,
        id: id,
      );

  SingleSeriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Series> Function(SingleSeriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleSeriesProvider._internal(
        (ref) => create(ref as SingleSeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Series> createElement() {
    return _SingleSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleSeriesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SingleSeriesRef on AutoDisposeStreamProviderRef<Series> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SingleSeriesProviderElement
    extends AutoDisposeStreamProviderElement<Series>
    with SingleSeriesRef {
  _SingleSeriesProviderElement(super.provider);

  @override
  String get id => (origin as SingleSeriesProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
