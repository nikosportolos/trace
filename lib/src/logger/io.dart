import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/logger.dart';

/// **IoLogger**
///
/// A [Logger] interface that uses an input [IOSink] to log messages.
abstract class IoLogger implements Logger {
  IoLogger({
    required final IOSink ioSink,
    final LogFilter? filter,
    this.level = LogLevel.verbose,
    final LoggerTheme? theme,
  })  : _sink = ioSink,
        filter = filter ?? DefaultLogFilter(level),
        theme = theme ?? LoggerTheme();

  @override
  final LogFilter filter;

  @override
  LogLevel level;

  final IOSink _sink;

  @override
  final LoggerTheme theme;

  @override
  void print(final LogEntry entry) {
    if (!filter.canLog(entry)) {
      return;
    }

    for (final LogSection section in theme.sections) {
      final String? text = theme.sectionThemeMap[section]?.formatter.format(theme, entry);
      if (text != null) {
        write(text);
      }
    }

    write(AnsiEscapeCodes.newLine);
  }

  void write(final String text) {
    _sink.write(text);
  }

  void writeln(final String text) {
    _sink.writeln(text);
  }

  @override
  Future<void> dispose() async {
    await _sink.flush();
    await _sink.close();
  }
}
