import 'package:trace/src/core/level.dart';

/// **LogEntry**
class LogEntry {
  LogEntry({
    this.message,
    this.error,
    this.stacktrace,
    required this.level,
  }) : timestamp = DateTime.now();

  final LogLevel level;
  final DateTime timestamp;
  final Object? message;
  final Object? error;
  final StackTrace? stacktrace;
}
