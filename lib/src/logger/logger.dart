import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filter.dart';
import 'package:trace/src/formatter/theme/theme.dart';

/// **Logger**
///
/// Base interface for loggers.
abstract class Logger {
  LogLevel level = LogLevel.info;

  LogFilter get filter;

  LoggerTheme get theme;

  void log(final LogEntry entry);

  void write(final Object? message);

  Future<void> dispose();
}
