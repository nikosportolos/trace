import 'package:trace/src/core/core.dart';
import 'package:trace/src/format/ansi.dart';
import 'package:trace/src/format/default.dart';
import 'package:trace/src/format/theme.dart';

export 'ansi.dart';
export 'default.dart';

abstract class LogFormatter {
  const LogFormatter();

  String format(final LogEntry entry);

  static List<LogFormatter> defaultFormatters({
    final bool level = false,
    final bool timestamp = false,
  }) {
    return <LogFormatter>[
      if (timestamp) TimestampFormatter(),
      if (level) LevelFormatter(),
      MessageFormatter(),
      ErrorFormatter(),
      StacktraceFormatter(),
    ];
  }

  static List<LogFormatter> ansiFormatters({
    final bool level = false,
    final bool timestamp = false,
    required final FormatterTheme theme,
  }) {
    return <LogFormatter>[
      if (timestamp) AnsiTimestampFormatter(theme: theme),
      if (level) AnsiLevelFormatter(theme: theme),
      AnsiMessageFormatter(theme: theme),
      AnsiErrorFormatter(theme: theme),
      AnsiStacktraceFormatter(theme: theme),
    ];
  }
}
