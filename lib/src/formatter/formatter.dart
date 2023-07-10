import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/section/section.dart';
import 'package:trace/src/formatter/theme.dart';

export 'section/section.dart';

/// **LogEntryFormatter**
class LogEntryFormatter {
  LogEntryFormatter(this.formatters);

  /// A list of the assigned formatters.
  final List<LogSectionFormatter> formatters;

  /// Format the given [LogEntry] using all assigned formatters.
  String format(final LogEntry entry) {
    final StringBuffer buffer = StringBuffer();

    buffer.writeAll(<String>[
      for (final LogSectionFormatter formatter in formatters) //
        formatter.format(entry),
    ]);

    return buffer.toString();
  }

  /// Returns a new instance of [LogEntryFormatter] with no theme.
  factory LogEntryFormatter.silent() {
    return LogEntryFormatter(
      <LogSectionFormatter>[],
    );
  }

  /// Returns a new instance of [LogEntryFormatter] with the default theme.
  factory LogEntryFormatter.$default([final LevelThemeMap? theme]) {
    final LevelThemeMap formatterTheme = theme ?? FormatTheme.defaultThemeMap;
    return LogEntryFormatter(
      <LogSectionFormatter>[
        TimestampFormatter(theme: formatterTheme),
        LevelFormatter(theme: formatterTheme),
        MessageFormatter(theme: formatterTheme),
        ErrorFormatter(theme: formatterTheme),
        StacktraceFormatter(theme: formatterTheme),
      ],
    );
  }

  /// Returns a new instance of [LogEntryFormatter] with ANSI theme.
  factory LogEntryFormatter.ansi([final LevelThemeMap? theme]) {
    final LevelThemeMap formatterTheme = theme ?? FormatTheme.ansiThemeMap;
    return LogEntryFormatter(
      <LogSectionFormatter>[
        TimestampFormatter(theme: formatterTheme),
        LevelFormatter(theme: formatterTheme),
        MessageFormatter(theme: formatterTheme),
        ErrorFormatter(theme: formatterTheme),
        StacktraceFormatter(theme: formatterTheme),
      ],
    );
  }
}
