import 'package:trace/src/core/core.dart';
import 'package:trace/src/core/formatter.dart';

/// **Logger**
///
/// Base interface for loggers.
abstract class Logger {
  Logger();

  LogFilter get filter;
  LogEntryFormatter get formatter;
  LogLevel level = LogLevel.info;

  void print(final LogEntry entry);
  Future<void> dispose();
}
