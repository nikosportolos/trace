// ignore_for_file: avoid_print

import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/logger.dart';

/// **IoLogger**
///
/// A [Logger] interface used on Flutter Web apps.
abstract class WebLogger implements Logger {
  WebLogger({
    final LogFilter? filter,
    this.level = LogLevel.verbose,
    final LoggerTheme? theme,
  })  : filter = filter ?? DefaultLogFilter(level),
        theme = theme ?? LoggerTheme();

  @override
  final LogFilter filter;

  @override
  LogLevel level;

  @override
  final LoggerTheme theme;

  @override
  void log(final LogEntry entry) {
    if (!filter.canLog(entry)) {
      return;
    }

    final StringBuffer buffer = StringBuffer();

    for (final LogSection section in theme.sections) {
      final String? text = theme.sectionThemeMap[section]?.formatter.format(theme, entry);
      if (text != null) {
        buffer.write(text);
      }
    }

    write(buffer.toString());
  }

  @override
  void write(final Object? message) {
    print(message);
  }

  @override
  Future<void> dispose() async {}
}
