// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'section.dart';

class _$LogSectionThemeImpl extends LogSectionTheme {
  const _$LogSectionThemeImpl({
    required this.textTheme,
    required this.formatter,
  }) : super.ctor();

  @override
  final AnsiTextTheme textTheme;

  @override
  final LogSectionFormatter formatter;

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is LogSectionTheme &&
            runtimeType == other.runtimeType &&
            textTheme == other.textTheme &&
            formatter == other.formatter;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      textTheme,
      formatter,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'LogSectionTheme{<optimized out>}';
    assert(() {
      toStringOutput =
          'LogSectionTheme@<$hexIdentity>{textTheme: $textTheme, formatter: $formatter}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => LogSectionTheme;
}

abstract interface class _LogSectionThemeCopyWithProxy {
  LogSectionTheme textTheme(AnsiTextTheme newValue);

  LogSectionTheme formatter(LogSectionFormatter newValue);

  LogSectionTheme call({
    final AnsiTextTheme? textTheme,
    final LogSectionFormatter? formatter,
  });
}

class _LogSectionThemeCopyWithProxyImpl
    implements _LogSectionThemeCopyWithProxy {
  _LogSectionThemeCopyWithProxyImpl(this._value);

  final LogSectionTheme _value;

  @pragma('vm:prefer-inline')
  @override
  LogSectionTheme textTheme(AnsiTextTheme newValue) =>
      this(textTheme: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogSectionTheme formatter(LogSectionFormatter newValue) =>
      this(formatter: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogSectionTheme call({
    final AnsiTextTheme? textTheme,
    final LogSectionFormatter? formatter,
  }) {
    return _$LogSectionThemeImpl(
      textTheme: textTheme ?? _value.textTheme,
      formatter: formatter ?? _value.formatter,
    );
  }
}

sealed class $LogSectionThemeCopyWithProxyChain<$Result> {
  factory $LogSectionThemeCopyWithProxyChain(final LogSectionTheme value,
          final $Result Function(LogSectionTheme update) chain) =
      _LogSectionThemeCopyWithProxyChainImpl<$Result>;

  $Result textTheme(AnsiTextTheme newValue);

  $Result formatter(LogSectionFormatter newValue);

  $Result call({
    final AnsiTextTheme? textTheme,
    final LogSectionFormatter? formatter,
  });
}

class _LogSectionThemeCopyWithProxyChainImpl<$Result>
    implements $LogSectionThemeCopyWithProxyChain<$Result> {
  _LogSectionThemeCopyWithProxyChainImpl(this._value, this._chain);

  final LogSectionTheme _value;
  final $Result Function(LogSectionTheme update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result textTheme(AnsiTextTheme newValue) => this(textTheme: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result formatter(LogSectionFormatter newValue) => this(formatter: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final AnsiTextTheme? textTheme,
    final LogSectionFormatter? formatter,
  }) {
    return _chain(_$LogSectionThemeImpl(
      textTheme: textTheme ?? _value.textTheme,
      formatter: formatter ?? _value.formatter,
    ));
  }
}

extension $LogSectionThemeExtension on LogSectionTheme {
  _LogSectionThemeCopyWithProxy get copyWith =>
      _LogSectionThemeCopyWithProxyImpl(this);
}
