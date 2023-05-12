import 'package:trace/src/core/core.dart';
import 'package:trace/src/format/format.dart';

abstract class Logger {
  Logger();

  LogFilter get filter;
  List<LogFormatter> get formatters;
  LogLevel level = LogLevel.info;

  Future<void> init();
  void print(final LogEntry entry);
  Future<void> dispose();
}
