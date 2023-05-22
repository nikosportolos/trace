import 'package:trace/src/core/core.dart';
import 'package:trace/src/core/formatter.dart';

/// **SilentLogger**
///
/// A [Logger] that mutes all messages.
class SilentLogger implements Logger {
  SilentLogger()
      : filter = SilentLogFilter(
          levelCallback: () => LogLevel.none,
        );

  @override
  LogLevel get level => LogLevel.none;

  @override
  final LogFilter filter;

  @override
  LogEntryFormatter get formatter => LogEntryFormatter.silent();

  @override
  set level(final LogLevel level) {}

  @override
  void print(final LogEntry entry) {}

  @override
  Future<void> dispose() async {}
}
