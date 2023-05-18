import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/format/format.dart';
import 'package:trace/src/format/theme.dart';

class ConsoleLogger implements Logger {
  ConsoleLogger({
    final IOSink? ioSink,
    final LogFilter? filter,
    this.level = LogLevel.verbose,
    final bool logLevel = true,
    final bool logTimestamp = true,
    final FormatterTheme? theme,
  })  : _sink = ioSink ?? stdout,
        filter = filter ?? DefaultLogFilter(levelCallback: () => level),
        formatters = LogFormatter.ansiFormat(
          level: logLevel,
          timestamp: logTimestamp,
          theme: theme ?? AnsiLogFormatter.defaultTheme,
        );

  @override
  final LogFilter filter;
  @override
  final List<LogFormatter> formatters;
  final IOSink _sink;

  @override
  late LogLevel level;

  @override
  Future<void> init() async {}

  @override
  void print(final LogEntry entry) {
    if (!filter.canLog(entry)) {
      return;
    }

    _sink.writeAll(<String>[
      for (final LogFormatter formatter in formatters) formatter.format(entry),
      AnsiEscapeCodes.newLine,
    ]);
  }

  @override
  Future<void> dispose() async {
    await _sink.flush();
    await _sink.close();
  }
}
