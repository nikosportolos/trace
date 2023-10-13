import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/logger.dart';

/// **SilentLogger**
///
/// A [Logger] that mutes all messages.
class SilentLogger implements Logger {
  SilentLogger() : filter = SilentLogFilter();

  @override
  LogLevel get level => LogLevel.none;

  @override
  final LogFilter filter;

  @override
  set level(final LogLevel level) {}

  @override
  void log(final LogEntry entry) {}

  @override
  void writeln(final Object? message) {}

  @override
  Future<void> dispose() async {}

  @override
  LoggerTheme get theme => LoggerTheme();
}
