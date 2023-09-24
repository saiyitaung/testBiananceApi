// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'484d159ed03c9711fbe59c980e97314230e33b0b';

/// See also [client].
@ProviderFor(client)
final clientProvider = Provider<Dio>.internal(
  client,
  name: r'clientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRef = ProviderRef<Dio>;
String _$currentMMKExchangeHash() =>
    r'746b6f928c888a9fd4060e28476f16d30cf437e2';

/// See also [currentMMKExchange].
@ProviderFor(currentMMKExchange)
final currentMMKExchangeProvider =
    AutoDisposeFutureProvider<List<CurrencyModel>>.internal(
  currentMMKExchange,
  name: r'currentMMKExchangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMMKExchangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentMMKExchangeRef
    = AutoDisposeFutureProviderRef<List<CurrencyModel>>;
String _$marketPriceStreamHash() => r'4ca2a74da34cbe319a8ad2e2c9386e28cfc3f6f1';

/// See also [marketPriceStream].
@ProviderFor(marketPriceStream)
final marketPriceStreamProvider = AutoDisposeStreamProvider<
    Map<String, BiananceMarketPriceResponse>>.internal(
  marketPriceStream,
  name: r'marketPriceStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$marketPriceStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MarketPriceStreamRef
    = AutoDisposeStreamProviderRef<Map<String, BiananceMarketPriceResponse>>;
String _$bTradeRateHash() => r'c074ba38026c2881711a9e1e2607e077f38ff208';

/// See also [bTradeRate].
@ProviderFor(bTradeRate)
final bTradeRateProvider =
    AutoDisposeStreamProvider<Map<String, BiananceTradeRateResponse>>.internal(
  bTradeRate,
  name: r'bTradeRateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bTradeRateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BTradeRateRef
    = AutoDisposeStreamProviderRef<Map<String, BiananceTradeRateResponse>>;
String _$cryptoNameHash() => r'0c7d69b7cb7e100dfcd3f4a36339c08211aa9841';

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

/// See also [cryptoName].
@ProviderFor(cryptoName)
const cryptoNameProvider = CryptoNameFamily();

/// See also [cryptoName].
class CryptoNameFamily extends Family<List<String>> {
  /// See also [cryptoName].
  const CryptoNameFamily();

  /// See also [cryptoName].
  CryptoNameProvider call({
    String? filter,
  }) {
    return CryptoNameProvider(
      filter: filter,
    );
  }

  @override
  CryptoNameProvider getProviderOverride(
    covariant CryptoNameProvider provider,
  ) {
    return call(
      filter: provider.filter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cryptoNameProvider';
}

/// See also [cryptoName].
class CryptoNameProvider extends AutoDisposeProvider<List<String>> {
  /// See also [cryptoName].
  CryptoNameProvider({
    String? filter,
  }) : this._internal(
          (ref) => cryptoName(
            ref as CryptoNameRef,
            filter: filter,
          ),
          from: cryptoNameProvider,
          name: r'cryptoNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cryptoNameHash,
          dependencies: CryptoNameFamily._dependencies,
          allTransitiveDependencies:
              CryptoNameFamily._allTransitiveDependencies,
          filter: filter,
        );

  CryptoNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final String? filter;

  @override
  Override overrideWith(
    List<String> Function(CryptoNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CryptoNameProvider._internal(
        (ref) => create(ref as CryptoNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<String>> createElement() {
    return _CryptoNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CryptoNameProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CryptoNameRef on AutoDisposeProviderRef<List<String>> {
  /// The parameter `filter` of this provider.
  String? get filter;
}

class _CryptoNameProviderElement
    extends AutoDisposeProviderElement<List<String>> with CryptoNameRef {
  _CryptoNameProviderElement(super.provider);

  @override
  String? get filter => (origin as CryptoNameProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
