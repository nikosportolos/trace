import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:trace/src/core/level.dart';

part 'entry.gen.dart';

/// **LogEntry**
@DataClass(
  toJson: true,
  fromJson: true,
)
abstract class LogEntry {
  LogEntry.ctor();

  /// Default constructor
  factory LogEntry({
    required LogLevel level,
    required DateTime timestamp,
    Object? message,
    Object? error,
    StackTrace? stacktrace,
  }) = _$LogEntryImpl;

  factory LogEntry.create({
    required LogLevel level,
    Object? message,
    Object? error,
    StackTrace? stacktrace,
  }) {
    return LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      error: error,
      stacktrace: stacktrace,
    );
  }

  LogLevel get level;

  DateTime get timestamp;

  Object? get message;

  Object? get error;

  StackTrace? get stacktrace;

  /// Creates an instance of [LogEntry] from [json]
  factory LogEntry.fromJson(Map<dynamic, dynamic> json) = _$LogEntryImpl.fromJson;

  /// Converts [LogEntry] to a [Map] json
  Map<String, dynamic> toJson();
}
