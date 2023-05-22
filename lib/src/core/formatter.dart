import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';

/// **LogEntryFormatter**
class LogEntryFormatter {
  LogEntryFormatter({
    final bool level = false,
    final bool timestamp = false,
    this.theme = const <LogLevel, FormatTheme>{},
    final List<LogSectionFormatter>? formatters,
  }) : formatters = formatters ??
            <LogSectionFormatter>[
              if (timestamp) TimestampFormatter(theme: theme),
              if (level) LevelFormatter(theme: theme),
              MessageFormatter(theme: theme),
              ErrorFormatter(theme: theme),
              StacktraceFormatter(theme: theme),
            ];

  /// A map of [FormatTheme] for each [LogLevel].
  final LevelThemeMap theme;

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

  /// Returns a new instance of [LogEntryFormatter] with ANSI theme.
  factory LogEntryFormatter.ansi({
    final bool level = false,
    final bool timestamp = false,
  }) {
    return LogEntryFormatter(
      theme: FormatTheme.ansiThemeMap,
      level: level,
      timestamp: timestamp,
    );
  }

  /// Returns a new instance of [LogEntryFormatter] with no theme.
  factory LogEntryFormatter.silent() {
    return LogEntryFormatter(
      theme: <LogLevel, FormatTheme>{},
      level: false,
      timestamp: false,
    );
  }

  /// Returns a new instance of [LogEntryFormatter] with standard theme.
  factory LogEntryFormatter.standard({
    final bool level = false,
    final bool timestamp = false,
  }) {
    return LogEntryFormatter(
      theme: FormatTheme.standardThemeMap,
      level: level,
      timestamp: timestamp,
    );
  }
}

/// **LogSectionFormatter**
///
/// Defines how a log section should be formatted.
///
/// Requires an input [LevelThemeMap].
abstract class LogSectionFormatter {
  const LogSectionFormatter({required this.theme});
  final LevelThemeMap theme;
  String format(final LogEntry entry);
}

/// **TimestampFormatter**
///
/// Formats [Timestamp] input with Ansi formatter.
class TimestampFormatter extends LogSectionFormatter {
  const TimestampFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      entry.timestamp.toString(),
      theme[entry.level]?.timestampTheme ?? FormatTheme.defaultTheme.timestampTheme,
    ).toString();
  }
}

/// **LevelFormatter**
///
/// Formats [LogLevel] input with Ansi formatter.
class LevelFormatter extends LogSectionFormatter {
  const LevelFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      entry.level.name.toUpperCase(),
      theme[entry.level]?.levelTheme ?? FormatTheme.defaultTheme.levelTheme,
    ).toString();
  }
}

/// **MessageFormatter**
///
/// Formats [Message] input with Ansi formatter.
class MessageFormatter extends LogSectionFormatter {
  const MessageFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.message == null) {
      return '';
    }
    return AnsiText.withTheme(
      entry.message.toString(),
      theme[entry.level]?.messageTheme ?? FormatTheme.defaultTheme.messageTheme,
    ).toString();
  }
}

/// **ErrorFormatter**
///
/// Formats [Error] input with Ansi formatter.
class ErrorFormatter extends LogSectionFormatter {
  const ErrorFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.error == null) {
      return '';
    }
    return AnsiText.withTheme(
      '\n\t${entry.error}',
      theme[entry.level]?.errorTheme ?? FormatTheme.defaultTheme.errorTheme,
    ).toString();
  }
}

/// **StacktraceFormatter**
///
/// Formats [StackTrace] input with Ansi formatter.
class StacktraceFormatter extends LogSectionFormatter {
  const StacktraceFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.stacktrace == null) {
      return '';
    }

    return AnsiText.withTheme(
      '\n\t${entry.stacktrace.toString().replaceAll('\n', '\n\t')}',
      theme[entry.level]?.stacktraceTheme ?? FormatTheme.defaultTheme.stacktraceTheme,
    ).toString();
  }
}
