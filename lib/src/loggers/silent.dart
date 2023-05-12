import 'package:trace/src/core/core.dart';
import 'package:trace/src/format/format.dart';

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
  List<LogFormatter> get formatters => const <LogFormatter>[];

  @override
  set level(final LogLevel level) {}

  @override
  Future<void> init() async {}

  @override
  void print(final LogEntry entry) {}

  @override
  Future<void> dispose() async {}
}
