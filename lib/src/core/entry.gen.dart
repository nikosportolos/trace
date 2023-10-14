// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'entry.dart';

class _$LogEntryImpl extends LogEntry {
  _$LogEntryImpl({
    required this.level,
    required this.timestamp,
    this.message,
    this.error,
    this.stacktrace,
  }) : super.ctor();

  @override
  final LogLevel level;

  @override
  final DateTime timestamp;

  @override
  final Object? message;

  @override
  final Object? error;

  @override
  final StackTrace? stacktrace;

  factory _$LogEntryImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$LogEntryImpl(
      level: LogLevel.fromJson(json['level']),
      timestamp: jsonConverterRegistrant
          .find(DateTime)
          .fromJson(json['timestamp'], json, 'timestamp') as DateTime,
      message: json['message'] == null
          ? null
          : jsonConverterRegistrant
              .find(Object)
              .fromJson(json['message'], json, 'message') as Object,
      error: json['error'] == null
          ? null
          : jsonConverterRegistrant
              .find(Object)
              .fromJson(json['error'], json, 'error') as Object,
      stacktrace: json['stacktrace'] == null
          ? null
          : jsonConverterRegistrant
              .find(StackTrace)
              .fromJson(json['stacktrace'], json, 'stacktrace') as StackTrace,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'level': level.toJson(),
      'timestamp': jsonConverterRegistrant.find(DateTime).toJson(timestamp),
      'message': message == null
          ? null
          : jsonConverterRegistrant.find(Object).toJson(message),
      'error': error == null
          ? null
          : jsonConverterRegistrant.find(Object).toJson(error),
      'stacktrace': stacktrace == null
          ? null
          : jsonConverterRegistrant.find(StackTrace).toJson(stacktrace),
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is LogEntry &&
            runtimeType == other.runtimeType &&
            level == other.level &&
            timestamp == other.timestamp &&
            message == other.message &&
            error == other.error &&
            stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      level,
      timestamp,
      message,
      error,
      stacktrace,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'LogEntry{<optimized out>}';
    assert(() {
      toStringOutput =
          'LogEntry@<$hexIdentity>{level: $level, timestamp: $timestamp, message: $message, error: $error, stacktrace: $stacktrace}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => LogEntry;
}

abstract interface class _LogEntryCopyWithProxy {
  LogEntry level(LogLevel newValue);

  LogEntry timestamp(DateTime newValue);

  LogEntry message(Object? newValue);

  LogEntry error(Object? newValue);

  LogEntry stacktrace(StackTrace? newValue);

  LogEntry call({
    final LogLevel? level,
    final DateTime? timestamp,
    final Object? message,
    final Object? error,
    final StackTrace? stacktrace,
  });
}

class _LogEntryCopyWithProxyImpl implements _LogEntryCopyWithProxy {
  _LogEntryCopyWithProxyImpl(this._value);

  final LogEntry _value;

  @pragma('vm:prefer-inline')
  @override
  LogEntry level(LogLevel newValue) => this(level: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogEntry timestamp(DateTime newValue) => this(timestamp: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogEntry message(Object? newValue) => this(message: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogEntry error(Object? newValue) => this(error: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogEntry stacktrace(StackTrace? newValue) => this(stacktrace: newValue);

  @pragma('vm:prefer-inline')
  @override
  LogEntry call({
    final LogLevel? level,
    final DateTime? timestamp,
    final Object? message = const Object(),
    final Object? error = const Object(),
    final Object? stacktrace = const Object(),
  }) {
    return _$LogEntryImpl(
      level: level ?? _value.level,
      timestamp: timestamp ?? _value.timestamp,
      message: identical(message, const Object())
          ? _value.message
          : (message as Object?),
      error:
          identical(error, const Object()) ? _value.error : (error as Object?),
      stacktrace: identical(stacktrace, const Object())
          ? _value.stacktrace
          : (stacktrace as StackTrace?),
    );
  }
}

sealed class $LogEntryCopyWithProxyChain<$Result> {
  factory $LogEntryCopyWithProxyChain(
          final LogEntry value, final $Result Function(LogEntry update) chain) =
      _LogEntryCopyWithProxyChainImpl<$Result>;

  $Result level(LogLevel newValue);

  $Result timestamp(DateTime newValue);

  $Result message(Object? newValue);

  $Result error(Object? newValue);

  $Result stacktrace(StackTrace? newValue);

  $Result call({
    final LogLevel? level,
    final DateTime? timestamp,
    final Object? message,
    final Object? error,
    final StackTrace? stacktrace,
  });
}

class _LogEntryCopyWithProxyChainImpl<$Result>
    implements $LogEntryCopyWithProxyChain<$Result> {
  _LogEntryCopyWithProxyChainImpl(this._value, this._chain);

  final LogEntry _value;
  final $Result Function(LogEntry update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result level(LogLevel newValue) => this(level: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result timestamp(DateTime newValue) => this(timestamp: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result message(Object? newValue) => this(message: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result error(Object? newValue) => this(error: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result stacktrace(StackTrace? newValue) => this(stacktrace: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final LogLevel? level,
    final DateTime? timestamp,
    final Object? message = const Object(),
    final Object? error = const Object(),
    final Object? stacktrace = const Object(),
  }) {
    return _chain(_$LogEntryImpl(
      level: level ?? _value.level,
      timestamp: timestamp ?? _value.timestamp,
      message: identical(message, const Object())
          ? _value.message
          : (message as Object?),
      error:
          identical(error, const Object()) ? _value.error : (error as Object?),
      stacktrace: identical(stacktrace, const Object())
          ? _value.stacktrace
          : (stacktrace as StackTrace?),
    ));
  }
}

extension $LogEntryExtension on LogEntry {
  _LogEntryCopyWithProxy get copyWith => _LogEntryCopyWithProxyImpl(this);
}
