import 'package:ansix/ansix.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/theme/theme.dart';

part 'level.dart';
part 'message.dart';
part 'timestamp.dart';

/// **LogSectionFormatter**
///
/// Defines how a log section should be formatted.
///
/// Requires an input [LevelThemeMap].
abstract class LogSectionFormatter {
  const LogSectionFormatter();

  String format(final LoggerTheme theme, final LogEntry entry);

  AnsiTextTheme getTextThemeForSection(final LoggerTheme theme, final LogLevel level, final LogSection section) {
    final AnsiColor foregroundColor = theme.colorMap[level] ?? AnsiColor.none;
    return theme.sectionThemeMap[section]?.textTheme.copyWith.foregroundColor(foregroundColor) ??
        AnsiTextTheme(foregroundColor: foregroundColor);
  }
}
