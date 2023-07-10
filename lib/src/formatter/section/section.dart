import 'package:ansix/ansix.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/theme.dart';

part 'error.dart';
part 'level.dart';
part 'message.dart';
part 'stacktrace.dart';
part 'timestamp.dart';

typedef LogLevelCallback = AnsiColor Function(LogEntry entry);

/// **LogSectionFormatter**
///
/// Defines how a log section should be formatted.
///
/// Requires an input [LevelThemeMap].
abstract class LogSectionFormatter {
  const LogSectionFormatter({required this.theme});

  final LevelThemeMap theme;

  factory LogSectionFormatter.error(final LevelThemeMap theme) => ErrorFormatter(theme: theme);

  factory LogSectionFormatter.level(final LevelThemeMap theme) => LevelFormatter(theme: theme);

  factory LogSectionFormatter.message(final LevelThemeMap theme) => MessageFormatter(theme: theme);

  factory LogSectionFormatter.stacktrace(final LevelThemeMap theme) => StacktraceFormatter(theme: theme);

  factory LogSectionFormatter.timestamp(final LevelThemeMap theme) => TimestampFormatter(theme: theme);

  String format(final LogEntry entry);
}
