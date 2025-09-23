import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/section/section.dart';
import 'package:trace/src/formatter/theme/section.dart';

export 'section.dart';

/// A collection of properties used by [Trace] in order to format the log messages.
///
/// - [colorMap]
///
///   A map of [AnsiColor] for each [LogLevel].
///
/// - [timestampFormat]
///
///   The format that will be used to print the timestamp of the log entry.
///
///   Defaults to [H:i:s.vu].
///
///   Accepts the following standard notations:
///
///   - `d` : Day of month (01 - 31)///
///   - `j` : Day of month, without leading 0s (1 - 31)
///   - `D` : An abbreviated textual representation of a day (Mon - Sun)
///   - `l` : A textual representation of a day (Monday - Sunday)
///   - `S` : Suffix of a day (st, th, nd)
///   - `z` : The day of the year (starting from 0)
///   - `F` : A textual representation of a month (January - December)
///   - `M` : An abbreviated textual representation of a month (Jan - Dec)
///   - `m` : Numeric representation of a month (01 - 12)
///   - `n` : Numeric representation of a month, without leading 0s (1 - 12)
///   - `Y` : Full numeric representation of a year (e.g. 2019)
///   - `y` : A two digit representation of a year (e.g. 19)
///   - `a` : Ante meridiem and post meridiem, lowercase (am or pm)
///   - `A` : Ante meridiem and post meridiem, uppercase (AM or PM)
///   - `g` : 12-hour format of an hour, without leading 0s (1 - 12)
///   - `h` : 12-hour format of an hour (01 - 12)
///   - `G` : 24-hour format of an hour, without leading 0s (0 - 23)
///   - `H` : 24-hour format of an hour (00 - 23)
///   - `i` : Minutes (0 - 59)
///   - `s` : Seconds (0 - 59)
///   - `v` : Milliseconds (0 - 999)
///   - `u` : Microseconds (0 - 999)
///   - `e` : System time zone identifier (Returns [DateTime.timeZoneName],
///     which is provided by the operating system and may be a name or abbreviation.)
///   - `O` : Difference to Greenwich Time (GMT) in hours (±0000)
///   - `P` : Difference to Greenwich Time (GMT) in hours with a colon (±00:00)
///   - `T` : Time zone abbreviation (Identifies the time zone from [DateTime.timeZoneName].)
///   - `c` : ISO 8601 date (e.g. 2019-10-15T19:42:05-08:00)
///   - `r` : RFC 2822 date (Tue, 15 Oct 2019 17:42:05 -0800)
///   - `U` : Seconds since Unix Epoch
///   - `\` : Escape character
///
/// - [stacktraceIndent]
///
///   Defines the amount of spaces that will be used to indent the stacktrace.
///
///   Defaults to 4.
///
/// - [sections]
///
///   Defines which [LogSection] will be printed and in what order.
///
///   Defaults to [LogSection.timestamp, LogSection.level, LogSection.message]
///
/// - [timestampTheme]
///
///   The [AnsiTextTheme] that will be used to print the timestamp of the log entry.
///
/// - [timestampFormatter]
///
///   The [LogSectionFormatter] that will be used to format the timestamp of the log entry.
///
/// - [levelTheme]
///
///   The [AnsiTextTheme] that will be used to print the level of the log entry.
///
/// - [levelFormatter]
///
///   The [LogSectionFormatter] that will be used to format the level of the log entry.
///
/// - [messageTheme]
///
///   The [AnsiTextTheme] that will be used to print the message of the log entry.
///
/// - [messageFormatter]
///
///   The [LogSectionFormatter] that will be used to format the message of the log entry.
class LoggerTheme {
  LoggerTheme({
    this.colorMap = const <LogLevel, AnsiColor>{},
    this.timestampFormat = r'H:i:s.vu',
    this.stacktraceIndent = 4,
    this.sections = const <LogSection>[
      LogSection.timestamp,
      LogSection.level,
      LogSection.message,
    ],
    final AnsiTextTheme? timestampTheme,
    final LogSectionFormatter? timestampFormatter,
    final AnsiTextTheme? levelTheme,
    final LogSectionFormatter? levelFormatter,
    final AnsiTextTheme? messageTheme,
    final LogSectionFormatter? messageFormatter,
    final bool? showError,
    final bool? showStackTrace,
  }) {
    for (final LogSection section in sections) {
      switch (section) {
        case LogSection.level:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: levelTheme ?? const AnsiTextTheme(fixedWidth: 10),
              formatter: levelFormatter ?? const LevelFormatter(),
            ),
          });
          break;

        case LogSection.timestamp:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: timestampTheme ?? const AnsiTextTheme(fixedWidth: 18),
              formatter: timestampFormatter ?? const TimestampFormatter(),
            ),
          });
          break;

        case LogSection.message:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: messageTheme ?? const AnsiTextTheme(),
              formatter:
                  messageFormatter ??
                  MessageFormatter(
                    showError: showError,
                    showStackTrace: showStackTrace,
                  ),
            ),
          });
          break;
      }
    }
  }

  final Map<LogLevel, AnsiColor> colorMap;

  /// Defines the order of the log entry sections.
  final List<LogSection> sections;
  final String timestampFormat;

  final int stacktraceIndent;

  Map<LogSection, LogSectionTheme> get sectionThemeMap => _sectionThemeMap;

  final Map<LogSection, LogSectionTheme> _sectionThemeMap =
      <LogSection, LogSectionTheme>{};

  static final Map<LogLevel, AnsiColor> defaultColorMap = <LogLevel, AnsiColor>{
    LogLevel.none: AnsiColor.none,
    LogLevel.verbose: AnsiColor.grey74,
    LogLevel.debug: AnsiColor.skyBlue3,
    LogLevel.info: AnsiColor.dodgerBlue1,
    LogLevel.success: AnsiColor.green2,
    LogLevel.warning: AnsiColor.orange3,
    LogLevel.error: AnsiColor.red,
    LogLevel.fatal: AnsiColor.red2,
  };
}
