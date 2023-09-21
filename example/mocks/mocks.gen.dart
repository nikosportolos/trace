// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'mocks.dart';

class _$MovieImpl extends Movie {
  const _$MovieImpl({
    required this.title,
    required this.releaseYear,
    required this.rate,
  }) : super.ctor();

  @override
  final String title;

  @override
  final int releaseYear;

  @override
  final double rate;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'releaseYear': releaseYear,
      'rate': rate,
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is Movie &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            releaseYear == other.releaseYear &&
            rate == other.rate;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      title,
      releaseYear,
      rate,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'Movie{<optimized out>}';
    assert(() {
      toStringOutput = 'Movie@<$hexIdentity>{title: $title, releaseYear: $releaseYear, rate: $rate}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => Movie;
}

abstract interface class _MovieCopyWithProxy {
  Movie title(String newValue);

  Movie releaseYear(int newValue);

  Movie rate(double newValue);

  Movie call({
    final String? title,
    final int? releaseYear,
    final double? rate,
  });
}

class _MovieCopyWithProxyImpl implements _MovieCopyWithProxy {
  _MovieCopyWithProxyImpl(this._value);

  final Movie _value;

  @pragma('vm:prefer-inline')
  @override
  Movie title(String newValue) => this(title: newValue);

  @pragma('vm:prefer-inline')
  @override
  Movie releaseYear(int newValue) => this(releaseYear: newValue);

  @pragma('vm:prefer-inline')
  @override
  Movie rate(double newValue) => this(rate: newValue);

  @pragma('vm:prefer-inline')
  @override
  Movie call({
    final String? title,
    final int? releaseYear,
    final double? rate,
  }) {
    return _$MovieImpl(
      title: title ?? _value.title,
      releaseYear: releaseYear ?? _value.releaseYear,
      rate: rate ?? _value.rate,
    );
  }
}

sealed class $MovieCopyWithProxyChain<$Result> {
  factory $MovieCopyWithProxyChain(final Movie value, final $Result Function(Movie update) chain) =
      _MovieCopyWithProxyChainImpl<$Result>;

  $Result title(String newValue);

  $Result releaseYear(int newValue);

  $Result rate(double newValue);

  $Result call({
    final String? title,
    final int? releaseYear,
    final double? rate,
  });
}

class _MovieCopyWithProxyChainImpl<$Result> implements $MovieCopyWithProxyChain<$Result> {
  _MovieCopyWithProxyChainImpl(this._value, this._chain);

  final Movie _value;
  final $Result Function(Movie update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result title(String newValue) => this(title: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result releaseYear(int newValue) => this(releaseYear: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result rate(double newValue) => this(rate: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final String? title,
    final int? releaseYear,
    final double? rate,
  }) {
    return _chain(_$MovieImpl(
      title: title ?? _value.title,
      releaseYear: releaseYear ?? _value.releaseYear,
      rate: rate ?? _value.rate,
    ));
  }
}

extension $MovieExtension on Movie {
  _MovieCopyWithProxy get copyWith => _MovieCopyWithProxyImpl(this);
}
