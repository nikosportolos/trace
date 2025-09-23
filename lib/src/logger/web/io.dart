import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/default.dart';
import 'package:trace/src/filter/filter.dart';
import 'package:trace/src/formatter/formatter.dart';
import 'package:trace/src/logger/logger.dart';

/// **IoLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class IoLogger implements Logger {
  IoLogger({
    this.level = LogLevel.verbose,
    final LoggerTheme? theme,
    final LogFilter? filter,
  }) : theme = theme ?? LoggerTheme(colorMap: LoggerTheme.defaultColorMap),
       filter = filter ?? DefaultLogFilter(level);

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
      final String? text = theme.sectionThemeMap[section]?.formatter.format(
        theme,
        entry,
      );
      if (text != null) {
        buffer.write(text);
      }
    }

    writeln(buffer.toString());
  }

  @override
  void writeln(final Object? message) {
    AnsiX.print(message);
  }

  @override
  Future<void> dispose() async {}
}
