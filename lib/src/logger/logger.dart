import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filter.dart';
import 'package:trace/src/formatter/theme/theme.dart';

/// **Logger**
///
/// Base interface for loggers.
abstract class Logger {
  LogFilter get filter;
  LoggerTheme get theme;
  LogLevel level = LogLevel.info;

  void print(final LogEntry entry);
  Future<void> dispose();
}
