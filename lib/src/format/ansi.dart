import 'package:ansix/ansix.dart';
import 'package:trace/src/core/entry.dart';
import 'package:trace/src/core/level.dart';
import 'package:trace/src/format/format.dart';
import 'package:trace/src/format/theme.dart';

abstract class AnsiLogFormatter extends LogFormatter {
  const AnsiLogFormatter({
    this.theme = const <LogLevel, FormatTheme>{},
  });

  final FormatterTheme theme;

  static final Map<LogLevel, FormatTheme> defaultTheme = <LogLevel, FormatTheme>{
    LogLevel.verbose: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.grey74,
    ),
    LogLevel.debug: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.skyBlue3,
    ),
    LogLevel.info: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.dodgerBlue1,
    ),
    LogLevel.warning: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.orange3,
    ),
    LogLevel.error: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.red,
    ),
    LogLevel.fatal: FormatTheme.defaultTheme(
      foregroundColor: AnsiColor.mediumPurple6,
    ),
  };
}

class AnsiTimestampFormatter extends AnsiLogFormatter {
  const AnsiTimestampFormatter({
    required super.theme,
  });

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      entry.timestamp.toString(),
      theme[entry.level]!.timestampTheme,
    ).toString();
  }
}

class AnsiLevelFormatter extends AnsiLogFormatter {
  const AnsiLevelFormatter({
    required super.theme,
  });

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      entry.level.name.toUpperCase(),
      theme[entry.level]!.levelTheme,
    ).toString();
  }
}

class AnsiMessageFormatter extends AnsiLogFormatter {
  const AnsiMessageFormatter({
    required super.theme,
  });

  @override
  String format(final LogEntry entry) {
    if (entry.message == null) {
      return '';
    }
    return AnsiText.withTheme(
      entry.message.toString(),
      theme[entry.level]!.messageTheme,
    ).toString();
  }
}

class AnsiErrorFormatter extends AnsiLogFormatter {
  const AnsiErrorFormatter({
    required super.theme,
  });

  @override
  String format(final LogEntry entry) {
    if (entry.error == null) {
      return '';
    }
    return AnsiText.withTheme(
      '\n\t${entry.error}',
      theme[entry.level]!.errorTheme,
    ).toString();
  }
}

class AnsiStacktraceFormatter extends AnsiLogFormatter {
  const AnsiStacktraceFormatter({
    required super.theme,
  });

  @override
  String format(final LogEntry entry) {
    if (entry.stacktrace == null) {
      return '';
    }

    return AnsiText.withTheme(
      '\n\t${entry.stacktrace.toString().replaceAll('\n', '\n\t')}',
      theme[entry.level]!.stacktraceTheme,
    ).toString();
  }
}
